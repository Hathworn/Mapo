; ModuleID = '../data/hip_kernels/890/33/main.cu'
source_filename = "../data/hip_kernels/890/33/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z24calculateDelaysAndPhasesPdddiiiPfPiS0_(double addrspace(1)* nocapture readonly %0, double %1, double %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, i32 addrspace(1)* nocapture writeonly %7, float addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !7
  %20 = mul i32 %11, %16
  %21 = add i32 %20, %10
  %22 = zext i32 %21 to i64
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %24 = zext i32 %23 to i64
  %25 = udiv i32 %19, %16
  %26 = mul i32 %25, %16
  %27 = icmp ugt i32 %19, %26
  %28 = zext i1 %27 to i32
  %29 = add i32 %25, %28
  %30 = mul i32 %29, %16
  %31 = shl nuw nsw i64 %24, 2
  %32 = getelementptr inbounds double, double addrspace(1)* %0, i64 %31
  %33 = add nuw nsw i64 %31, 3
  %34 = getelementptr inbounds double, double addrspace(1)* %0, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16, !amdgpu.noclobber !6
  %36 = load double, double addrspace(1)* %32, align 8, !tbaa !16, !amdgpu.noclobber !6
  %37 = uitofp i32 %21 to double
  %38 = fmul contract double %36, %37
  %39 = fmul contract double %38, %37
  %40 = getelementptr inbounds double, double addrspace(1)* %32, i64 1
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !16, !amdgpu.noclobber !6
  %42 = fmul contract double %41, %37
  %43 = fadd contract double %39, %42
  %44 = getelementptr inbounds double, double addrspace(1)* %32, i64 2
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !16, !amdgpu.noclobber !6
  %46 = fadd contract double %45, %43
  %47 = fadd contract double %37, 5.000000e-01
  %48 = fmul contract double %36, %47
  %49 = fmul contract double %47, %48
  %50 = fmul contract double %41, %47
  %51 = fadd contract double %50, %49
  %52 = fadd contract double %45, %51
  %53 = fadd contract double %37, 1.000000e+00
  %54 = fmul contract double %36, %53
  %55 = fmul contract double %53, %54
  %56 = fmul contract double %41, %53
  %57 = fadd contract double %56, %55
  %58 = fadd contract double %45, %57
  %59 = fsub contract double %58, %46
  %60 = fmul contract double %59, 5.000000e-01
  %61 = fadd contract double %46, %60
  %62 = fsub contract double %52, %61
  %63 = fdiv contract double %62, 3.000000e+00
  %64 = fadd contract double %46, %63
  %65 = fadd contract double %60, %64
  %66 = sitofp i32 %3 to double
  %67 = fdiv contract double %59, %66
  %68 = fsub contract double %65, %35
  %69 = fdiv contract double %68, %2
  %70 = sitofp i32 %5 to double
  %71 = fdiv contract double %69, %70
  %72 = tail call double @llvm.rint.f64(double %71)
  %73 = fptosi double %72 to i32
  %74 = mul nsw i32 %73, %5
  %75 = sext i32 %30 to i64
  %76 = mul nsw i64 %75, %24
  %77 = add nsw i64 %76, %22
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %77
  store i32 %74, i32 addrspace(1)* %78, align 4, !tbaa !20
  %79 = sitofp i32 %74 to double
  %80 = fsub contract double %69, %79
  %81 = fmul contract double %80, -2.000000e+00
  %82 = fmul contract double %81, 0x400921FB54442D18
  %83 = fdiv contract double %82, %66
  %84 = fptrunc double %83 to float
  %85 = getelementptr inbounds float, float addrspace(1)* %8, i64 %77
  store float %84, float addrspace(1)* %85, align 4, !tbaa !22
  %86 = fmul contract double %64, %1
  %87 = fptosi double %86 to i32
  %88 = sitofp i32 %87 to double
  %89 = fsub contract double %86, %88
  %90 = fptrunc double %89 to float
  %91 = fmul contract float %90, 2.000000e+00
  %92 = fpext float %91 to double
  %93 = fmul contract double %92, 0x400921FB54442D18
  %94 = fptrunc double %93 to float
  %95 = shl i64 %77, 1
  %96 = getelementptr inbounds float, float addrspace(1)* %6, i64 %95
  store float %94, float addrspace(1)* %96, align 4, !tbaa !22
  %97 = fmul contract double %67, %1
  %98 = fptrunc double %97 to float
  %99 = fmul contract float %98, 2.000000e+00
  %100 = fpext float %99 to double
  %101 = fmul contract double %100, 0x400921FB54442D18
  %102 = fptrunc double %101 to float
  %103 = add nuw nsw i64 %95, 1
  %104 = getelementptr inbounds float, float addrspace(1)* %6, i64 %103
  store float %102, float addrspace(1)* %104, align 4, !tbaa !22
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !18, i64 0}
!22 = !{!23, !23, i64 0}
!23 = !{!"float", !18, i64 0}
