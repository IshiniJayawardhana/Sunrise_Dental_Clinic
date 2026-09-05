package com.sunriseDental.Dao;

	import com.sunriseDental.model.Appointment;

	import java.util.Map;
	import java.util.concurrent.ConcurrentHashMap;
	import java.util.concurrent.atomic.AtomicInteger;

	
	public final class AppointmentStore {

	    private static final Map<String, Appointment> APPOINTMENTS = new ConcurrentHashMap<>();
	    private static final AtomicInteger NEXT_NUMBER = new AtomicInteger(1004);

	    static {
	        // Seed data so Display/Bill have something to find out of the box.
	        Appointment demo = new Appointment(
	                "APP-1001",
	                "John Doe",
	                "123 Main Street, Colombo 03",
	                "0771234567",
	                "Dr. Perera",
	                "Filling",
	                "2026-09-10",
	                "10:30",
	                "Confirmed"
	        );
	        APPOINTMENTS.put(demo.getAppointmentId(), demo);
	    }

	    private AppointmentStore() {
	        // static utility class
	    }

	    /** Generates the next sequential appointment ID, e.g. APP-1005. */
	    public static synchronized String nextAppointmentId() {
	        return "APP-" + NEXT_NUMBER.getAndIncrement();
	    }

	    /** Saves (or overwrites) an appointment record. */
	    public static void save(Appointment appointment) {
	        if (appointment != null && appointment.getAppointmentId() != null) {
	            APPOINTMENTS.put(normalize(appointment.getAppointmentId()), appointment);
	        }
	    }

	    /** Looks up an appointment by ID; returns null if not found or id is blank. */
	    public static Appointment find(String appointmentId) {
	        if (appointmentId == null || appointmentId.trim().isEmpty()) {
	            return null;
	        }
	        return APPOINTMENTS.get(normalize(appointmentId));
	    }

	    private static String normalize(String id) {
	        return id.trim().toUpperCase();
	    }
	}


