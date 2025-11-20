"use client";
import { useState, useEffect } from "react";
import { Calendar, Button } from "@heroui/react";
import { today, getLocalTimeZone } from "@internationalized/date";
import type { DateValue } from "@internationalized/date";
import { I18nProvider } from "@react-aria/i18n";

const STORAGE_KEY = "telemedicina_available_dates";

export default function AppointmentCalendar() {
  const [selectedDates, setSelectedDates] = useState<Set<string>>(new Set());
  const [focusedDate, setFocusedDate] = useState<DateValue | null>(null);
  const todayDate = today(getLocalTimeZone());

  useEffect(() => {
    const storedDates = sessionStorage.getItem(STORAGE_KEY);
    if (storedDates) {
      try {
        const parsedDates = JSON.parse(storedDates);
        setSelectedDates(new Set(parsedDates));
      } catch (error) {
        console.error("Error loading dates from session storage:", error);
      }
    }
  }, []);

  useEffect(() => {
    if (selectedDates.size > 0) {
      sessionStorage.setItem(
        STORAGE_KEY,
        JSON.stringify(Array.from(selectedDates)),
      );
    } else {
      sessionStorage.removeItem(STORAGE_KEY);
    }
  }, [selectedDates]);

  const handleDateClick = (date: DateValue) => {
    const dateString = date.toString();
    setSelectedDates((prev) => {
      const newSet = new Set(prev);
      if (newSet.has(dateString)) {
        newSet.delete(dateString);
      } else {
        newSet.add(dateString);
      }
      return newSet;
    });
    setFocusedDate(date);
  };

  const handleRemoveDate = (dateString: string) => {
    setSelectedDates((prev) => {
      const newSet = new Set(prev);
      newSet.delete(dateString);
      return newSet;
    });
  };

  const handleSave = () => {
    alert(`${selectedDates.size} dias de disponibilidade salvos!`);
  };

  return (
    <I18nProvider locale="pt-BR">
      <div className="flex flex-col gap-4">
        <div>
          <h2 className="text-2xl font-bold mb-2">Definir Disponibilidade</h2>
          <p className="text-gray-600 mb-4">
            Selecione os dias em que você estará disponível para consultas de
            telemedicina
          </p>
        </div>

        <div className="flex justify-center">
          <Calendar
            aria-label="Calendário de disponibilidade"
            minValue={todayDate}
            value={focusedDate}
            visibleMonths={3}
            isDateUnavailable={(date) => date.compare(todayDate) < 0}
            onChange={handleDateClick}
            classNames={{
              base: "shadow-lg",
              cellButton: [
                "data-[selected=true]:bg-green-200",
                "data-[selected=true]:text-green-900",
                "data-[selected=true]:font-bold",
              ],
            }}
          />
        </div>

        <div className="flex flex-col gap-4">
          {selectedDates.size > 0 && (
            <div className="p-4 bg-green-50 rounded-lg">
              <div className="flex flex-wrap gap-2">
                {Array.from(selectedDates).map((date) => (
                  <span
                    key={date}
                    className="px-3 py-1 bg-green-100 text-green-800 rounded-full text-sm flex items-center gap-2"
                  >
                    {new Date(date + "T00:00:00").toLocaleDateString("pt-BR")}
                    <button
                      onClick={() => handleRemoveDate(date)}
                      className="hover:bg-green-200 rounded-full p-0.5 transition-colors"
                      aria-label="Remover data"
                    >
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        className="h-4 w-4"
                        viewBox="0 0 20 20"
                        fill="currentColor"
                      >
                        <path
                          fillRule="evenodd"
                          d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                          clipRule="evenodd"
                        />
                      </svg>
                    </button>
                  </span>
                ))}
              </div>
            </div>
          )}

          <div className="p-4 bg-blue-50 rounded-lg">
            <h3 className="font-semibold mb-2">Como funciona:</h3>
            <ul className="list-disc list-inside space-y-1 text-sm text-gray-700">
              <li>Clique nas datas em que você estará disponível</li>
              <li>Pacientes poderão agendar consultas nos dias marcados</li>
            </ul>
          </div>

          <Button
            color="primary"
            size="lg"
            onPress={handleSave}
            isDisabled={selectedDates.size === 0}
            className="w-full"
          >
            Salvar Disponibilidade
          </Button>
        </div>
      </div>
    </I18nProvider>
  );
}
