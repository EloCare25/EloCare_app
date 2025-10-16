import Link from "next/link";
import { getClinicById } from "@/app/lib/queries";
import ClinicCard from "../components/clinic-card";
import ArrowBack from "@/app/resources/icons/arrow-back";

type PageProps = {
  params: { id: string };
};

export default async function ClinicPage({ params }: PageProps) {
  try {
    const { id } = await params;
    const clinic = getClinicById(id);

    return clinic ? (
      <div className="md:flex">
        {/*<Link href="/clinicas" className="text-sm flex items-baseline gap-2 h-min hover:underline cont mb-3.5">
          <ArrowBack /> <span>Voltar</span>
        </Link>*/}
        <ClinicCard clinic={clinic} />
      </div>
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
