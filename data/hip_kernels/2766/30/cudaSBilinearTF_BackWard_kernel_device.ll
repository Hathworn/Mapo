; ModuleID = '../data/hip_kernels/2766/30/main.cu'
source_filename = "../data/hip_kernels/2766/30/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z31cudaSBilinearTF_BackWard_kerneljjjjjjffPKfPf(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, float %6, float %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 8
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !6
  %19 = add i32 %17, %18
  %20 = mul i32 %19, %2
  %21 = mul i32 %5, %4
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = icmp ult i32 %22, %2
  br i1 %23, label %24, label %48

24:                                               ; preds = %10
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %26 = icmp ult i32 %25, %1
  %27 = add i32 %5, -1
  %28 = uitofp i32 %27 to float
  %29 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %30 = icmp ult i32 %29, %0
  %31 = add i32 %4, -1
  %32 = uitofp i32 %31 to float
  %33 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %34 = bitcast i8 addrspace(4)* %33 to i16 addrspace(4)*
  %35 = load i16, i16 addrspace(4)* %34, align 4
  %36 = zext i16 %35 to i32
  %37 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %38 = bitcast i8 addrspace(4)* %37 to i16 addrspace(4)*
  %39 = load i16, i16 addrspace(4)* %38, align 2
  %40 = zext i16 %39 to i32
  %41 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %42 = bitcast i8 addrspace(4)* %41 to i32 addrspace(4)*
  %43 = load i32, i32 addrspace(4)* %42, align 4, !tbaa !7
  %44 = udiv i32 %43, %36
  %45 = mul i32 %44, %36
  %46 = icmp ugt i32 %43, %45
  %47 = zext i1 %46 to i32
  br label %49

48:                                               ; preds = %56, %10
  ret void

49:                                               ; preds = %24, %56
  %50 = phi i32 [ %22, %24 ], [ %58, %56 ]
  br i1 %26, label %51, label %56

51:                                               ; preds = %49
  %52 = add i32 %50, %20
  %53 = mul i32 %21, %52
  %54 = add i32 %50, %20
  %55 = mul i32 %54, %1
  br label %60

56:                                               ; preds = %80, %49
  %57 = add i32 %44, %50
  %58 = add i32 %57, %47
  %59 = icmp ult i32 %58, %2
  br i1 %59, label %49, label %48, !llvm.loop !16

60:                                               ; preds = %51, %80
  %61 = phi i32 [ %25, %51 ], [ %81, %80 ]
  %62 = uitofp i32 %61 to float
  %63 = fmul contract float %62, %7
  %64 = tail call float @llvm.floor.f32(float %63)
  %65 = fptosi float %64 to i32
  %66 = sitofp i32 %65 to float
  %67 = fsub contract float %63, %66
  %68 = fsub contract float 1.000000e+00, %67
  br i1 %30, label %69, label %80

69:                                               ; preds = %60
  %70 = fcmp contract olt float %63, %28
  %71 = tail call float @llvm.ceil.f32(float %63)
  %72 = select i1 %70, float %71, float %28
  %73 = fptosi float %72 to i32
  %74 = mul i32 %65, %4
  %75 = add i32 %53, %74
  %76 = mul i32 %73, %4
  %77 = add i32 %53, %76
  %78 = add i32 %55, %61
  %79 = mul i32 %78, %0
  br label %83

80:                                               ; preds = %83, %60
  %81 = add i32 %61, %40
  %82 = icmp ult i32 %81, %1
  br i1 %82, label %60, label %56, !llvm.loop !18

83:                                               ; preds = %69, %83
  %84 = phi i32 [ %29, %69 ], [ %126, %83 ]
  %85 = uitofp i32 %84 to float
  %86 = fmul contract float %85, %6
  %87 = tail call float @llvm.floor.f32(float %86)
  %88 = fptosi float %87 to i32
  %89 = fcmp contract olt float %86, %32
  %90 = tail call float @llvm.ceil.f32(float %86)
  %91 = select i1 %89, float %90, float %32
  %92 = fptosi float %91 to i32
  %93 = sitofp i32 %88 to float
  %94 = fsub contract float %86, %93
  %95 = fsub contract float 1.000000e+00, %94
  %96 = add i32 %75, %88
  %97 = add i32 %75, %92
  %98 = add i32 %77, %88
  %99 = add i32 %77, %92
  %100 = add i32 %84, %79
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %8, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !19
  %104 = fmul contract float %68, %103
  %105 = fmul contract float %95, %104
  %106 = zext i32 %96 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %9, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !19
  %109 = fadd contract float %108, %105
  store float %109, float addrspace(1)* %107, align 4, !tbaa !19
  %110 = fmul contract float %94, %104
  %111 = zext i32 %97 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %9, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !19
  %114 = fadd contract float %110, %113
  store float %114, float addrspace(1)* %112, align 4, !tbaa !19
  %115 = fmul contract float %67, %103
  %116 = fmul contract float %95, %115
  %117 = zext i32 %98 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %9, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !19
  %120 = fadd contract float %116, %119
  store float %120, float addrspace(1)* %118, align 4, !tbaa !19
  %121 = fmul contract float %94, %115
  %122 = zext i32 %99 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %9, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !19
  %125 = fadd contract float %121, %124
  store float %125, float addrspace(1)* %123, align 4, !tbaa !19
  %126 = add i32 %84, %36
  %127 = icmp ult i32 %126, %0
  br i1 %127, label %83, label %80, !llvm.loop !23
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

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
declare i32 @llvm.amdgcn.workgroup.id.z() #2

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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = distinct !{!18, !17}
!19 = !{!20, !20, i64 0}
!20 = !{!"float", !21, i64 0}
!21 = !{!"omnipotent char", !22, i64 0}
!22 = !{!"Simple C++ TBAA"}
!23 = distinct !{!23, !17}
