import { getAllTransports } from "@/app/lib/queries";
import TransportClinicsList from "./components/transport-clinics-list";

export default async function TransportsPage() {
  try {
    const clinics = getAllTransports();

    return <TransportClinicsList data={clinics} />;
  } catch (error) {
    console.error("Error rendering TransportsPage:", error);
  }
}
