"use client";
import {
  Card,
  CardHeader,
  CardBody,
  CardFooter,
  Button,
  Image,
  Chip,
} from "@heroui/react";
import { routes } from "@/app/config/routes";
import { useRouter } from "next/navigation";

const cardImages = {
  clinicas: "https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d",
  equipamentos:
    "https://images.unsplash.com/photo-1664902265139-934219cee42f",
  telemedicina: "https://images.unsplash.com/photo-1758691462749-a95ce1bd7f96",
  transporte: "https://images.unsplash.com/photo-1554734867-bf3c00a49371",
};

export default function Home() {
  const router = useRouter();

  return (
    <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
      {routes.map((route) => {
        return (
          <Card
            key={route.id}
            isPressable
            isDisabled={!route.enabled}
            shadow="sm"
            onPress={() => route.enabled && router.push(route.pathname)}
          >
            <CardBody className="overflow-visible p-0">
              <Image
                className="w-full object-cover h-[240px]"
                radius="lg"
                shadow="sm"
                src={cardImages[route.id as keyof typeof cardImages]}
                width="100%"
              />
            </CardBody>
            <CardFooter className="text-small justify-between">
              <b>{route.title}</b>{!route.enabled && <Chip size="sm" variant="shadow" className="bg-[#ebebeb]">Em breve</Chip>}
            </CardFooter>
          </Card>
        );
      })}
    </div>
  );
}
