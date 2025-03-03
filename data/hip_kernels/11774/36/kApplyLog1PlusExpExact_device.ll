; ModuleID = '../data/hip_kernels/11774/36/main.cu'
source_filename = "../data/hip_kernels/11774/36/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22kApplyLog1PlusExpExactPfS_j(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = mul i32 %4, %9
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %15 = add i32 %13, %14
  %16 = udiv i32 %12, %9
  %17 = mul i32 %16, %9
  %18 = icmp ugt i32 %12, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %9
  %22 = icmp ult i32 %15, %2
  br i1 %22, label %24, label %23

23:                                               ; preds = %90, %3
  ret void

24:                                               ; preds = %3, %90
  %25 = phi i32 [ %93, %90 ], [ %15, %3 ]
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %0, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !16
  %29 = fcmp contract ogt float %28, 0.000000e+00
  br i1 %29, label %30, label %61

30:                                               ; preds = %24
  %31 = fneg contract float %28
  %32 = fmul float %28, 0xBFF7154760000000
  %33 = tail call float @llvm.rint.f32(float %32)
  %34 = fcmp olt float %28, 0xC0562E4300000000
  %35 = fcmp ogt float %28, 0x4059D1DA00000000
  %36 = fneg float %32
  %37 = tail call float @llvm.fma.f32(float %31, float 0x3FF7154760000000, float %36)
  %38 = tail call float @llvm.fma.f32(float %31, float 0x3E54AE0BE0000000, float %37)
  %39 = fsub float %32, %33
  %40 = fadd float %38, %39
  %41 = tail call float @llvm.exp2.f32(float %40)
  %42 = fptosi float %33 to i32
  %43 = tail call float @llvm.amdgcn.ldexp.f32(float %41, i32 %42)
  %44 = fadd contract float %43, 1.000000e+00
  %45 = select i1 %35, float 1.000000e+00, float %44
  %46 = select i1 %34, float 0x7FF0000000000000, float %45
  %47 = tail call i1 @llvm.amdgcn.class.f32(float %46, i32 144)
  %48 = select i1 %47, float 0x41F0000000000000, float 1.000000e+00
  %49 = fmul float %46, %48
  %50 = tail call float @llvm.log2.f32(float %49)
  %51 = fmul float %50, 0x3FE62E42E0000000
  %52 = tail call i1 @llvm.amdgcn.class.f32(float %50, i32 519)
  %53 = fneg float %51
  %54 = tail call float @llvm.fma.f32(float %50, float 0x3FE62E42E0000000, float %53)
  %55 = tail call float @llvm.fma.f32(float %50, float 0x3E6EFA39E0000000, float %54)
  %56 = fadd float %51, %55
  %57 = select i1 %52, float %50, float %56
  %58 = select i1 %47, float 0x40362E4300000000, float 0.000000e+00
  %59 = fsub float %57, %58
  %60 = fadd contract float %28, %59
  br label %90

61:                                               ; preds = %24
  %62 = fmul float %28, 0x3FF7154760000000
  %63 = tail call float @llvm.rint.f32(float %62)
  %64 = fcmp ogt float %28, 0x40562E4300000000
  %65 = fcmp olt float %28, 0xC059D1DA00000000
  %66 = fneg float %62
  %67 = tail call float @llvm.fma.f32(float %28, float 0x3FF7154760000000, float %66)
  %68 = tail call float @llvm.fma.f32(float %28, float 0x3E54AE0BE0000000, float %67)
  %69 = fsub float %62, %63
  %70 = fadd float %68, %69
  %71 = tail call float @llvm.exp2.f32(float %70)
  %72 = fptosi float %63 to i32
  %73 = tail call float @llvm.amdgcn.ldexp.f32(float %71, i32 %72)
  %74 = fadd contract float %73, 1.000000e+00
  %75 = select i1 %65, float 1.000000e+00, float %74
  %76 = select i1 %64, float 0x7FF0000000000000, float %75
  %77 = tail call i1 @llvm.amdgcn.class.f32(float %76, i32 144)
  %78 = select i1 %77, float 0x41F0000000000000, float 1.000000e+00
  %79 = fmul float %76, %78
  %80 = tail call float @llvm.log2.f32(float %79)
  %81 = fmul float %80, 0x3FE62E42E0000000
  %82 = tail call i1 @llvm.amdgcn.class.f32(float %80, i32 519)
  %83 = fneg float %81
  %84 = tail call float @llvm.fma.f32(float %80, float 0x3FE62E42E0000000, float %83)
  %85 = tail call float @llvm.fma.f32(float %80, float 0x3E6EFA39E0000000, float %84)
  %86 = fadd float %81, %85
  %87 = select i1 %82, float %80, float %86
  %88 = select i1 %77, float 0x40362E4300000000, float 0.000000e+00
  %89 = fsub float %87, %88
  br label %90

90:                                               ; preds = %30, %61
  %91 = phi float [ %60, %30 ], [ %89, %61 ]
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  store float %91, float addrspace(1)* %92, align 4
  %93 = add i32 %25, %21
  %94 = icmp ult i32 %93, %2
  br i1 %94, label %24, label %23, !llvm.loop !20
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
