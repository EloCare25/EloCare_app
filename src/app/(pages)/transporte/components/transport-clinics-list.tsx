"use client";
import { useState, useDeferredValue, useEffect } from "react";
import {
  ScrollShadow,
  Input,
  Card,
  CardBody,
  CardFooter,
  Image,
  Button,
  Chip
} from "@heroui/react";
import type { Clinic } from "@/app/lib/queries";

const STORAGE_KEY = "transport_timers";

interface TransportTimer {
  clinicId: number;
  endTime: number;
  requested: boolean;
}

export default function TransportClinicsList({ data }: { data: Clinic[] }) {
  const [selectedClinic, setSelectedClinic] = useState<Clinic>(data[0]);
  const [address, setAddress] = useState<string>("Avenida Paulista, 100");
  const [transportRequested, setTransportRequested] = useState(false);
  const [timeRemaining, setTimeRemaining] = useState(0);

  const deferredAddress = useDeferredValue(address);

  useEffect(() => {
    const storedTimers = sessionStorage.getItem(STORAGE_KEY);
    if (!storedTimers) return;

    try {
      const timers: TransportTimer[] = JSON.parse(storedTimers);
      const clinicTimer = timers.find(t => t.clinicId === selectedClinic.id_clinica);

      if (clinicTimer && clinicTimer.requested) {
        const now = Date.now();
        const remaining = Math.max(0, Math.floor((clinicTimer.endTime - now) / 1000));

        if (remaining > 0) {
          setTransportRequested(true);
          setTimeRemaining(remaining);
        } else {
          setTransportRequested(false);
          setTimeRemaining(0);
        }
      } else {
        setTransportRequested(false);
        setTimeRemaining(0);
      }
    } catch (error) {
      console.error("Error loading transport timers:", error);
    }
  }, [selectedClinic.id_clinica]);

  useEffect(() => {
    if (!transportRequested) return;

    const timer = setInterval(() => {
      setTimeRemaining((prev) => {
        if (prev <= 1) {
          setTransportRequested(false);
          return 0;
        }
        return prev - 1;
      });
    }, 1000);

    return () => clearInterval(timer);
  }, [transportRequested]);

  const saveTimerToStorage = (endTime: number) => {
    const storedTimers = sessionStorage.getItem(STORAGE_KEY);
    let timers: TransportTimer[] = storedTimers ? JSON.parse(storedTimers) : [];

    timers = timers.filter(t => t.clinicId !== selectedClinic.id_clinica);

    timers.push({
      clinicId: selectedClinic.id_clinica,
      endTime,
      requested: true,
    });

    sessionStorage.setItem(STORAGE_KEY, JSON.stringify(timers));
  };

  const handleRequestTransport = () => {
    const minMinutes = 45;
    const maxMinutes = 60;
    const randomMinutes = Math.floor(Math.random() * (maxMinutes - minMinutes + 1)) + minMinutes;
    const randomSeconds = randomMinutes * 60;

    const endTime = Date.now() + (randomSeconds * 1000);

    setTransportRequested(true);
    setTimeRemaining(randomSeconds);
    saveTimerToStorage(endTime);
  };

  const formatTime = (seconds: number) => {
    const mins = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return `${mins}:${secs.toString().padStart(2, '0')}`;
  };

  return (
    <div className="grid lg:grid-cols-[auto_70%] gap-6 lg:h-full">
      <div className="overflow-y-auto overflow-x-visible h-full lg:overflow-x-auto">
        <div className="flex lg:flex-col gap-4 p-1 pb-6">
          {data.map((clinic) => (
            <Card
              key={clinic.id_clinica}
              isPressable
              isBlurred={selectedClinic?.id_clinica !== clinic.id_clinica}
              shadow="sm"
              onPress={() => setSelectedClinic(clinic)}
              className="min-w-[200px]"
            >
              <CardBody className="overflow-visible p-0 flex-none">
                <Image
                  className="w-full object-cover h-[100px] lg:h-[240px]"
                  radius="lg"
                  shadow="sm"
                  src={clinic.imagem!}
                  width="100%"
                />
              </CardBody>
              <CardFooter className="flex-col items-start h-full">
                <strong>{clinic.nome_fantasia || clinic.razao_social}</strong>
              </CardFooter>
            </Card>
          ))}
        </div>
      </div>
      <div>
        <div className="mb-2">
          <Input
            radius="md"
            labelPlacement="outside"
            name="address"
            placeholder="Digite seu Endereço"
            isClearable
            onChange={(e) => setAddress(e.target.value)}
          />
        </div>
        <iframe
          width="100%"
          height="300px"
          loading="lazy"
          src={`https://www.google.com/maps?q=from+${encodeURIComponent(deferredAddress)}+to+${encodeURIComponent(selectedClinic.nome_fantasia!)}&output=embed`}
        ></iframe>
        {selectedClinic && (
          <div className="flex flex-col gap-4 mt-5">
            <strong>
              {selectedClinic.nome_fantasia || selectedClinic.razao_social}
            </strong>
            <p>{selectedClinic.endereco}</p>
            {!transportRequested ? (
              <Button color="primary" onPress={handleRequestTransport}>
                Solicitar Transporte
              </Button>
            ) : (
              <div className="flex flex-col gap-3 p-4 bg-green-50 rounded-lg border-2 border-green-200">
                <div className="flex items-center gap-2">
                  <Chip color="success" variant="flat" size="lg">
                    Transporte a caminho
                  </Chip>
                </div>
                <div className="flex items-center justify-between">
                  <span className="text-sm text-gray-600">Tempo estimado:</span>
                  <span className="text-2xl font-bold text-green-700">
                    {formatTime(timeRemaining)}
                  </span>
                </div>
                {timeRemaining === 0 && (
                  <div className="text-center text-green-700 font-semibold">
                    Transporte chegou!
                  </div>
                )}
              </div>
            )}
          </div>
        )}
      </div>
    </div>
  );
}
