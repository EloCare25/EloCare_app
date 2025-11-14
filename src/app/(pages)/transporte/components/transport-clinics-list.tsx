"use client";
import { useState, useDeferredValue } from "react";
import {
  ScrollShadow,
  Input,
  Card,
  CardBody,
  CardFooter,
  Image,
  Button
} from "@heroui/react";
import type { Clinic } from "@/app/lib/queries";

export default function TransportClinicsList({ data }: { data: Clinic[] }) {
  const [selectedClinic, setSelectedClinic] = useState<Clinic>(data[0]);
  const [address, setAddress] = useState<string>("Avenida Paulista, 100");

  const deferredAddress = useDeferredValue(address);

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
            <Button color="primary">
              Solicitar Transporte
            </Button>
          </div>
        )}
      </div>
    </div>
  );
}
