import { NextResponse } from "next/server";
import { getAllClinics } from "@/app/lib/queries";

export async function GET(request: Request) {
  try {

    return NextResponse.json({ success: true, data: getAllClinics() });
  } catch (error) {
    console.error("Error fetching all clinics:", error);
    return NextResponse.json(
      {
        success: false,
        error: "Failed to fetch clinics",
        details: error instanceof Error ? error.message : "Unknown error",
      },
      { status: 500 },
    );
  }
}
