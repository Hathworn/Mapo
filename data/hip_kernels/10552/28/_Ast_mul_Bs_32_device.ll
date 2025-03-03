; ModuleID = '../data/hip_kernels/10552/28/main.cu'
source_filename = "../data/hip_kernels/10552/28/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14_Ast_mul_Bs_32iiPfPiS0_S_S0_S0_S_(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
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
  %22 = mul nsw i32 %1, %0
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %97

24:                                               ; preds = %9
  %25 = udiv i32 %19, %16
  %26 = mul i32 %25, %16
  %27 = icmp ugt i32 %19, %26
  %28 = zext i1 %27 to i32
  %29 = add i32 %25, %28
  %30 = mul i32 %29, %16
  br label %31

31:                                               ; preds = %24, %90
  %32 = phi i32 [ %21, %24 ], [ %95, %90 ]
  %33 = freeze i32 %32
  %34 = freeze i32 %0
  %35 = sdiv i32 %33, %34
  %36 = mul i32 %35, %34
  %37 = sub i32 %33, %36
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %38
  %40 = bitcast i32 addrspace(1)* %39 to <2 x i32> addrspace(1)*
  %41 = load <2 x i32>, <2 x i32> addrspace(1)* %40, align 4, !tbaa !16
  %42 = extractelement <2 x i32> %41, i64 1
  %43 = add nsw i32 %42, -1
  %44 = sext i32 %35 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %44
  %46 = bitcast i32 addrspace(1)* %45 to <2 x i32> addrspace(1)*
  %47 = load <2 x i32>, <2 x i32> addrspace(1)* %46, align 4, !tbaa !16
  %48 = extractelement <2 x i32> %47, i64 1
  %49 = add nsw i32 %48, -1
  %50 = extractelement <2 x i32> %41, i64 0
  %51 = icmp slt i32 %50, %42
  %52 = extractelement <2 x i32> %47, i64 0
  %53 = icmp slt i32 %52, %48
  %54 = select i1 %51, i1 %53, i1 false
  br i1 %54, label %55, label %90

55:                                               ; preds = %31
  %56 = add nsw i32 %52, -1
  %57 = add nsw i32 %50, -1
  br label %58

58:                                               ; preds = %55, %83
  %59 = phi double [ %86, %83 ], [ 0.000000e+00, %55 ]
  %60 = phi i32 [ %85, %83 ], [ %57, %55 ]
  %61 = phi i32 [ %84, %83 ], [ %56, %55 ]
  %62 = sext i32 %60 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %62
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !16, !amdgpu.noclobber !6
  %65 = sext i32 %61 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %65
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !16, !amdgpu.noclobber !6
  %68 = icmp slt i32 %67, %64
  br i1 %68, label %69, label %71

69:                                               ; preds = %58
  %70 = add nsw i32 %61, 1
  br label %83

71:                                               ; preds = %58
  %72 = icmp slt i32 %64, %67
  %73 = add nsw i32 %60, 1
  br i1 %72, label %83, label %74

74:                                               ; preds = %71
  %75 = getelementptr inbounds float, float addrspace(1)* %2, i64 %62
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !20
  %77 = add nsw i32 %61, 1
  %78 = getelementptr inbounds float, float addrspace(1)* %5, i64 %65
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !20
  %80 = fmul contract float %76, %79
  %81 = fpext float %80 to double
  %82 = fadd contract double %59, %81
  br label %83

83:                                               ; preds = %71, %74, %69
  %84 = phi i32 [ %70, %69 ], [ %77, %74 ], [ %61, %71 ]
  %85 = phi i32 [ %60, %69 ], [ %73, %74 ], [ %73, %71 ]
  %86 = phi double [ %59, %69 ], [ %82, %74 ], [ %59, %71 ]
  %87 = icmp slt i32 %85, %43
  %88 = icmp slt i32 %84, %49
  %89 = select i1 %87, i1 %88, i1 false
  br i1 %89, label %58, label %90, !llvm.loop !22

90:                                               ; preds = %83, %31
  %91 = phi double [ 0.000000e+00, %31 ], [ %86, %83 ]
  %92 = fptrunc double %91 to float
  %93 = sext i32 %32 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %8, i64 %93
  store float %92, float addrspace(1)* %94, align 4, !tbaa !20
  %95 = add i32 %30, %32
  %96 = icmp slt i32 %95, %22
  br i1 %96, label %31, label %97, !llvm.loop !24

97:                                               ; preds = %90, %9
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
