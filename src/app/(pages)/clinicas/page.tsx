import ClinicsList from "./components/clinics-list";
import { getAllClinics } from "@/app/lib/queries";

export default async function ClinicsPage() {
  try {
    const clinics = getAllClinics();
    return <ClinicsList data={clinics} />;
  } catch (error) {
    console.error("Error rendering ClinicsPage:", error);
  }
}
