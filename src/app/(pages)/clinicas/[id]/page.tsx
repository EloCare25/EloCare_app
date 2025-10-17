import Link from "next/link";
import { getClinicById } from "@/app/lib/queries";
import ClinicCard from "../components/clinic-card";

type PageProps = {
  params: { id: string };
};

export default async function ClinicPage({ params }: PageProps) {
  try {
    const { id } = await params;
    const clinic = getClinicById(id);

    return clinic ? (
      <ClinicCard clinic={clinic} />
    ) : (
      <div className="flex place-content-center h-full items-center flex-col">
        Clínica não encontrada
        <Link href="/clinicas" className="underline">
          Ver todas as clínicas
        </Link>
      </div>
    );
  } catch (error) {
    console.error(error);
  }
}
