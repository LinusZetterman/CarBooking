import { getAllBookings } from "#lib/server/bookings.service.ts";

export async function load() {
    const bookings = await getAllBookings();
    return {bookings};
}