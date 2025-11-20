import { getAllEquipments } from "@/app/lib/queries";
import EquipmentTable from "./components/equipment-table";

export default async function EquipmentPage() {
  try {
    const equipments = getAllEquipments();

    return (
      <div className="flex flex-col gap-4">
        <div>
          <h2 className="text-2xl font-bold mb-2">Equipamentos Médicos</h2>
          <p className="text-gray-600 mb-4">
            Listagem de equipamentos disponíveis para compra
          </p>
        </div>

        <EquipmentTable data={equipments} />
      </div>
    );
  } catch (error) {
    console.error("Error rendering EquipmentPage:", error);
    return (
      <div className="p-4 bg-red-50 rounded-lg">
        <p className="text-red-600">Erro ao carregar equipamentos</p>
      </div>
    );
  }
}
