import { get } from "@/app/helpers/fetch";
import ClinicsList from "./components/clinics-list";
import { getAllClinics, type Clinic } from "@/app/lib/queries";

export default async function ClinicsPage() {
  try {
    const res = await get<Clinic[]>(
      `${process.env.NEXT_PUBLIC_SITE_DOMAIN}/api/v1/clinics`,
    );
    if (res.data) {
      return <ClinicsList data={res.data} />;
    }
  } catch (error) {
    console.error(error);
  }
}
