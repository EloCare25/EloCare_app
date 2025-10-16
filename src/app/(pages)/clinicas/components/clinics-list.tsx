"use client";
import { Card, CardBody, CardFooter, Image, Chip } from "@heroui/react";
import PinIcon from "@/app/resources/icons/pin";
import type { Clinic } from "@/app/lib/queries";
import { useRouter } from "next/navigation";

export default function ClinicsList({ data }: { data: Clinic[] }) {

  const router = useRouter()

  return (
    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
      {data.map((clinic) => (
        <Card
          key={clinic.id_clinica}
          isPressable
          shadow="sm"
          onPress={() => router.push(`/clinicas/${clinic.id_clinica}`)}
        >
          <CardBody className="overflow-visible p-0 flex-none">
            <Image
              className="w-full object-cover h-[240px]"
              radius="lg"
              shadow="sm"
              src={clinic.imagem!}
              width="100%"
            />
          </CardBody>
          <CardFooter className="flex-col items-start h-full">
            <strong>{clinic.nome_fantasia || clinic.razao_social}</strong>
            {clinic.especialidades && (
              <div className="flex flex-wrap my-2.5">
                {clinic.especialidades.split(",").map((esp) => (
                  <Chip key={esp} className="mr-2 mb-2 bg-[#bcb7e6] text-white">
                    {esp}
                  </Chip>
                ))}
              </div>
            )}
            {clinic.cidade && clinic.estado && (
              <p className="text-tiny text-default-400 flex gap-1 mt-auto">
                <PinIcon /> {clinic.cidade}, {clinic.estado}
              </p>
            )}
          </CardFooter>
        </Card>
      ))}
    </div>
  );
}
