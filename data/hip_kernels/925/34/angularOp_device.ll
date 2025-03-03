; ModuleID = '../data/hip_kernels/925/34/main.cu'
source_filename = "../data/hip_kernels/925/34/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x double> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z9angularOpddP15HIP_vector_typeIdLj2EEPdS1_(double %0, double %1, %struct.HIP_vector_type addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !4
  %12 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !13, !invariant.load !14
  %15 = zext i16 %14 to i32
  %16 = udiv i32 %11, %15
  %17 = mul i32 %16, %15
  %18 = icmp ugt i32 %11, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 16
  %22 = bitcast i8 addrspace(4)* %21 to i32 addrspace(4)*
  %23 = load i32, i32 addrspace(4)* %22, align 8, !tbaa !15
  %24 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 2, !range !13, !invariant.load !14
  %27 = zext i16 %26 to i32
  %28 = udiv i32 %23, %27
  %29 = mul i32 %28, %27
  %30 = icmp ugt i32 %23, %29
  %31 = zext i1 %30 to i32
  %32 = add i32 %28, %31
  %33 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %34 = mul i32 %32, %33
  %35 = add i32 %34, %7
  %36 = mul i32 %35, %20
  %37 = add i32 %36, %6
  %38 = getelementptr i8, i8 addrspace(4)* %8, i64 8
  %39 = bitcast i8 addrspace(4)* %38 to i16 addrspace(4)*
  %40 = load i16, i16 addrspace(4)* %39, align 4, !range !13, !invariant.load !14
  %41 = zext i16 %40 to i32
  %42 = mul i32 %37, %41
  %43 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !16
  %44 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !16
  %45 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %46 = add i32 %42, %44
  %47 = mul i32 %46, %27
  %48 = add i32 %47, %43
  %49 = mul i32 %48, %15
  %50 = add i32 %49, %45
  %51 = fneg contract double %0
  %52 = zext i32 %50 to i64
  %53 = getelementptr inbounds double, double addrspace(1)* %3, i64 %52
  %54 = load double, double addrspace(1)* %53, align 8, !tbaa !17, !amdgpu.noclobber !14
  %55 = fmul contract double %54, %51
  %56 = fmul contract double %55, %1
  %57 = fmul double %56, 0x3FF71547652B82FE
  %58 = tail call double @llvm.rint.f64(double %57)
  %59 = fneg double %58
  %60 = tail call double @llvm.fma.f64(double %59, double 0x3FE62E42FEFA39EF, double %56)
  %61 = tail call double @llvm.fma.f64(double %59, double 0x3C7ABC9E3B39803F, double %60)
  %62 = tail call double @llvm.fma.f64(double %61, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %63 = tail call double @llvm.fma.f64(double %61, double %62, double 0x3EC71DEE623FDE64)
  %64 = tail call double @llvm.fma.f64(double %61, double %63, double 0x3EFA01997C89E6B0)
  %65 = tail call double @llvm.fma.f64(double %61, double %64, double 0x3F2A01A014761F6E)
  %66 = tail call double @llvm.fma.f64(double %61, double %65, double 0x3F56C16C1852B7B0)
  %67 = tail call double @llvm.fma.f64(double %61, double %66, double 0x3F81111111122322)
  %68 = tail call double @llvm.fma.f64(double %61, double %67, double 0x3FA55555555502A1)
  %69 = tail call double @llvm.fma.f64(double %61, double %68, double 0x3FC5555555555511)
  %70 = tail call double @llvm.fma.f64(double %61, double %69, double 0x3FE000000000000B)
  %71 = tail call double @llvm.fma.f64(double %61, double %70, double 1.000000e+00)
  %72 = tail call double @llvm.fma.f64(double %61, double %71, double 1.000000e+00)
  %73 = fptosi double %58 to i32
  %74 = tail call double @llvm.amdgcn.ldexp.f64(double %72, i32 %73)
  %75 = fcmp ogt double %56, 1.024000e+03
  %76 = select i1 %75, double 0x7FF0000000000000, double %74
  %77 = fcmp olt double %56, -1.075000e+03
  %78 = select i1 %77, double 0.000000e+00, double %76
  %79 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %52, i32 0, i32 0, i32 0, i64 0
  %80 = load double, double addrspace(1)* %79, align 16, !tbaa !21, !amdgpu.noclobber !14
  %81 = fmul contract double %80, %78
  %82 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %52, i32 0, i32 0, i32 0, i64 1
  %83 = load double, double addrspace(1)* %82, align 8, !tbaa !21, !amdgpu.noclobber !14
  %84 = fmul contract double %83, %78
  %85 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %52, i32 0, i32 0, i32 0, i64 0
  store double %81, double addrspace(1)* %85, align 16
  %86 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %52, i32 0, i32 0, i32 0, i64 1
  store double %84, double addrspace(1)* %86, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!18 = !{!"double", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = !{!19, !19, i64 0}
