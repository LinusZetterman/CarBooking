<script lang=ts>
	import type { PageProps } from "./$types";
    let {data}: PageProps = $props();
</script>

<h1>Welcome to my website</h1>
<p>Hope you like this test!</p>
<p>Visit <a href="https://svelte.dev/docs/kit">svelte.dev/docs/kit</a> to read the documentation</p>
<div>
    <p>Here are your bookings:</p>
    {#if data.bookings.length == 0}
        <p>No bookings found</p>
    {:else}
        <ul>
            {#each data.bookings as booking (booking.id)}
                <li>{booking.car_id}, {booking.user_id}</li>
            {/each}
        </ul>
    {/if}
</div>