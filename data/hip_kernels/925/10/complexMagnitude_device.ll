; ModuleID = '../data/hip_kernels/925/10/main.cu'
source_filename = "../data/hip_kernels/925/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x double> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16complexMagnitudeP15HIP_vector_typeIdLj2EEPd(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %7 = bitcast i8 addrspace(4)* %6 to i32 addrspace(4)*
  %8 = load i32, i32 addrspace(4)* %7, align 4, !tbaa !4
  %9 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !13, !invariant.load !14
  %12 = zext i16 %11 to i32
  %13 = udiv i32 %8, %12
  %14 = mul i32 %13, %12
  %15 = icmp ugt i32 %8, %14
  %16 = zext i1 %15 to i32
  %17 = add i32 %13, %16
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 16
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 8, !tbaa !15
  %21 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 2, !range !13, !invariant.load !14
  %24 = zext i16 %23 to i32
  %25 = udiv i32 %20, %24
  %26 = mul i32 %25, %24
  %27 = icmp ugt i32 %20, %26
  %28 = zext i1 %27 to i32
  %29 = add i32 %25, %28
  %30 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %31 = mul i32 %29, %30
  %32 = add i32 %31, %4
  %33 = mul i32 %32, %17
  %34 = add i32 %33, %3
  %35 = getelementptr i8, i8 addrspace(4)* %5, i64 8
  %36 = bitcast i8 addrspace(4)* %35 to i16 addrspace(4)*
  %37 = load i16, i16 addrspace(4)* %36, align 4, !range !13, !invariant.load !14
  %38 = zext i16 %37 to i32
  %39 = mul i32 %34, %38
  %40 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !16
  %41 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !16
  %42 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %43 = add i32 %39, %41
  %44 = mul i32 %43, %24
  %45 = add i32 %44, %40
  %46 = mul i32 %45, %12
  %47 = add i32 %46, %42
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %48, i32 0, i32 0, i32 0, i64 0
  %50 = load double, double addrspace(1)* %49, align 16, !tbaa !17, !amdgpu.noclobber !14
  %51 = fmul contract double %50, %50
  %52 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %48, i32 0, i32 0, i32 0, i64 1
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !17, !amdgpu.noclobber !14
  %54 = fmul contract double %53, %53
  %55 = fadd contract double %51, %54
  %56 = fcmp olt double %55, 0x1000000000000000
  %57 = select i1 %56, double 0x4FF0000000000000, double 1.000000e+00
  %58 = fmul double %55, %57
  %59 = tail call double @llvm.amdgcn.rsq.f64(double %58)
  %60 = fmul double %58, %59
  %61 = fmul double %59, 5.000000e-01
  %62 = fneg double %61
  %63 = tail call double @llvm.fma.f64(double %62, double %60, double 5.000000e-01)
  %64 = tail call double @llvm.fma.f64(double %61, double %63, double %61)
  %65 = tail call double @llvm.fma.f64(double %60, double %63, double %60)
  %66 = fneg double %65
  %67 = tail call double @llvm.fma.f64(double %66, double %65, double %58)
  %68 = tail call double @llvm.fma.f64(double %67, double %64, double %65)
  %69 = fneg double %68
  %70 = tail call double @llvm.fma.f64(double %69, double %68, double %58)
  %71 = tail call double @llvm.fma.f64(double %70, double %64, double %68)
  %72 = select i1 %56, double 0x37F0000000000000, double 1.000000e+00
  %73 = fmul double %72, %71
  %74 = fcmp oeq double %58, 0.000000e+00
  %75 = fcmp oeq double %58, 0x7FF0000000000000
  %76 = or i1 %74, %75
  %77 = select i1 %76, double %58, double %73
  %78 = getelementptr inbounds double, double addrspace(1)* %1, i64 %48
  store double %77, double addrspace(1)* %78, align 8, !tbaa !20
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{!5, !9, i64 16}
!16 = !{i32 0, i32 1024}
!17 = !{!18, !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"double", !18, i64 0}
