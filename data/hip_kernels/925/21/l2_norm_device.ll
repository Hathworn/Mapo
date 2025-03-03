; ModuleID = '../data/hip_kernels/925/21/main.cu'
source_filename = "../data/hip_kernels/925/21/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x double> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7l2_normP15HIP_vector_typeIdLj2EES1_S1_Pd(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture readonly %1, %struct.HIP_vector_type addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %9 = bitcast i8 addrspace(4)* %8 to i32 addrspace(4)*
  %10 = load i32, i32 addrspace(4)* %9, align 4, !tbaa !4
  %11 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !13, !invariant.load !14
  %14 = zext i16 %13 to i32
  %15 = udiv i32 %10, %14
  %16 = mul i32 %15, %14
  %17 = icmp ugt i32 %10, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 16
  %21 = bitcast i8 addrspace(4)* %20 to i32 addrspace(4)*
  %22 = load i32, i32 addrspace(4)* %21, align 8, !tbaa !15
  %23 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !13, !invariant.load !14
  %26 = zext i16 %25 to i32
  %27 = udiv i32 %22, %26
  %28 = mul i32 %27, %26
  %29 = icmp ugt i32 %22, %28
  %30 = zext i1 %29 to i32
  %31 = add i32 %27, %30
  %32 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %33 = mul i32 %31, %32
  %34 = add i32 %33, %6
  %35 = mul i32 %34, %19
  %36 = add i32 %35, %5
  %37 = getelementptr i8, i8 addrspace(4)* %7, i64 8
  %38 = bitcast i8 addrspace(4)* %37 to i16 addrspace(4)*
  %39 = load i16, i16 addrspace(4)* %38, align 4, !range !13, !invariant.load !14
  %40 = zext i16 %39 to i32
  %41 = mul i32 %36, %40
  %42 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !16
  %43 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !16
  %44 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %45 = add i32 %41, %43
  %46 = mul i32 %45, %26
  %47 = add i32 %46, %42
  %48 = mul i32 %47, %14
  %49 = add i32 %48, %44
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %50, i32 0, i32 0, i32 0, i64 0
  %52 = load double, double addrspace(1)* %51, align 16, !tbaa !17, !amdgpu.noclobber !14
  %53 = fmul contract double %52, %52
  %54 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %50, i32 0, i32 0, i32 0, i64 1
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !17, !amdgpu.noclobber !14
  %56 = fmul contract double %55, %55
  %57 = fadd contract double %53, %56
  %58 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %50, i32 0, i32 0, i32 0, i64 0
  %59 = load double, double addrspace(1)* %58, align 16, !tbaa !17, !amdgpu.noclobber !14
  %60 = fmul contract double %59, %59
  %61 = fadd contract double %57, %60
  %62 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %50, i32 0, i32 0, i32 0, i64 1
  %63 = load double, double addrspace(1)* %62, align 8, !tbaa !17, !amdgpu.noclobber !14
  %64 = fmul contract double %63, %63
  %65 = fadd contract double %61, %64
  %66 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %50, i32 0, i32 0, i32 0, i64 0
  %67 = load double, double addrspace(1)* %66, align 16, !tbaa !17, !amdgpu.noclobber !14
  %68 = fmul contract double %67, %67
  %69 = fadd contract double %65, %68
  %70 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %50, i32 0, i32 0, i32 0, i64 1
  %71 = load double, double addrspace(1)* %70, align 8, !tbaa !17, !amdgpu.noclobber !14
  %72 = fmul contract double %71, %71
  %73 = fadd contract double %69, %72
  %74 = fcmp olt double %73, 0x1000000000000000
  %75 = select i1 %74, double 0x4FF0000000000000, double 1.000000e+00
  %76 = fmul double %73, %75
  %77 = tail call double @llvm.amdgcn.rsq.f64(double %76)
  %78 = fmul double %76, %77
  %79 = fmul double %77, 5.000000e-01
  %80 = fneg double %79
  %81 = tail call double @llvm.fma.f64(double %80, double %78, double 5.000000e-01)
  %82 = tail call double @llvm.fma.f64(double %79, double %81, double %79)
  %83 = tail call double @llvm.fma.f64(double %78, double %81, double %78)
  %84 = fneg double %83
  %85 = tail call double @llvm.fma.f64(double %84, double %83, double %76)
  %86 = tail call double @llvm.fma.f64(double %85, double %82, double %83)
  %87 = fneg double %86
  %88 = tail call double @llvm.fma.f64(double %87, double %86, double %76)
  %89 = tail call double @llvm.fma.f64(double %88, double %82, double %86)
  %90 = select i1 %74, double 0x37F0000000000000, double 1.000000e+00
  %91 = fmul double %90, %89
  %92 = fcmp oeq double %76, 0.000000e+00
  %93 = fcmp oeq double %76, 0x7FF0000000000000
  %94 = or i1 %92, %93
  %95 = select i1 %94, double %76, double %91
  %96 = getelementptr inbounds double, double addrspace(1)* %3, i64 %50
  store double %95, double addrspace(1)* %96, align 8, !tbaa !20
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
