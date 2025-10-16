"use client";
import {
  Card,
  CardHeader,
  CardBody,
  CardFooter,
  Button,
  Image,
} from "@heroui/react";

export default function Home() {
  return (
    <div>
      <Card isPressable shadow="sm">
        <CardBody className="overflow-visible p-0">
          <Image
            className="w-full object-cover h-[240px]"
            radius="lg"
            shadow="sm"
            src="https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d"
            width="100%"
          />
        </CardBody>
        <CardFooter className="text-small justify-between">
          <b>Clínica 1</b>
        </CardFooter>
      </Card>
    </div>
  );
}
