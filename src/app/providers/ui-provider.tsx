"use client";

import * as React from "react";

import {HeroUIProvider} from "@heroui/react";

export const UiProvider = ({children}: {children: React.ReactNode}) => {
  return (
    <HeroUIProvider>
      {children}
    </HeroUIProvider>
  );
}
