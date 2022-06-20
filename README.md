# audless, a headless audible client

## Dependencies

To run:
1. `ffmpeg`
1. `sqlite3`

To setup:
1. `chromedriver` or `geckodriver`
1. Your specific Audible activation bytes (which you can get via https://github.com/inAudible-NG/audible-activator.git)

## Setup

1. Update `schema.sql` w/ your activation bytes
1. Run `cat schema.sql | sqlite3 audless.db`
1. Update `QUEUE` in `refresh_queue` to point to the directory where you store your aax files
1. Run `refresh_queue`

### Administrivia

1. The user you run as needs permissions to write to `/var/log/audless`
1. The user you run as needs permissions to write to the directory containing your `.db` file
1. This is currently configured to output to `alsa :: hw` (in my case, the Pi's HDMI 0 output)

## Running

Run `play_next`. This will find the next file in your queue that isn't fully listened to (within 30s of the stream ending), and begin playing from the last recorded location.

## Maintenance

You'll want to run `refresh_queue` periodically (it's idempotent) to discover new audiobooks and add them to your queue.
