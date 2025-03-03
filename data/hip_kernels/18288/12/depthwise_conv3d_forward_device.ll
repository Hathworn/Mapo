; ModuleID = '../data/hip_kernels/18288/12/main.cu'
source_filename = "../data/hip_kernels/18288/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24depthwise_conv3d_forwardiiiiiiPKiS0_S0_PKfS2_Pf(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7, i32 addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture readonly %10, float addrspace(1)* nocapture %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = icmp slt i32 %13, %0
  br i1 %14, label %15, label %41

15:                                               ; preds = %12
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = getelementptr inbounds i8, i8 addrspace(4)* %17, i64 12
  %23 = bitcast i8 addrspace(4)* %22 to i32 addrspace(4)*
  %24 = load i32, i32 addrspace(4)* %23, align 4, !tbaa !6
  %25 = mul i32 %16, %21
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %27 = add i32 %25, %26
  %28 = mul i32 %4, %3
  %29 = mul nsw i32 %28, %2
  %30 = icmp slt i32 %27, %29
  %31 = getelementptr inbounds i8, i8 addrspace(4)* %17, i64 16
  %32 = bitcast i8 addrspace(4)* %31 to i32 addrspace(4)*
  %33 = getelementptr i8, i8 addrspace(4)* %17, i64 6
  %34 = bitcast i8 addrspace(4)* %33 to i16 addrspace(4)*
  %35 = load i16, i16 addrspace(4)* %34, align 2
  %36 = zext i16 %35 to i32
  %37 = udiv i32 %24, %21
  %38 = mul i32 %37, %21
  %39 = icmp ugt i32 %24, %38
  %40 = zext i1 %39 to i32
  br label %42

41:                                               ; preds = %55, %12
  ret void

42:                                               ; preds = %15, %55
  %43 = phi i32 [ %13, %15 ], [ %57, %55 ]
  br i1 %30, label %44, label %55

44:                                               ; preds = %42
  %45 = mul nsw i32 %43, %2
  %46 = mul nsw i32 %43, %1
  %47 = mul i32 %28, %45
  %48 = load i32, i32 addrspace(4)* %32, align 8, !tbaa !16
  %49 = udiv i32 %48, %36
  %50 = mul i32 %49, %36
  %51 = icmp ugt i32 %48, %50
  %52 = zext i1 %51 to i32
  %53 = add i32 %49, %52
  %54 = mul i32 %53, %21
  br label %59

55:                                               ; preds = %108, %42
  %56 = add i32 %37, %43
  %57 = add i32 %56, %40
  %58 = icmp slt i32 %57, %0
  br i1 %58, label %42, label %41, !llvm.loop !17

59:                                               ; preds = %44, %108
  %60 = phi i32 [ %27, %44 ], [ %109, %108 ]
  %61 = freeze i32 %60
  %62 = freeze i32 %28
  %63 = sdiv i32 %61, %62
  %64 = mul i32 %63, %62
  %65 = sub i32 %61, %64
  %66 = sdiv i32 %65, %4
  %67 = add nsw i32 %63, %45
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !19, !amdgpu.noclobber !5
  %71 = icmp sgt i32 %70, 0
  br i1 %71, label %72, label %108

72:                                               ; preds = %59
  %73 = mul i32 %67, %5
  %74 = sitofp i32 %70 to float
  %75 = add nsw i32 %60, %47
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %11, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !23
  %79 = and i32 %70, 1
  %80 = icmp eq i32 %70, 1
  br i1 %80, label %83, label %81

81:                                               ; preds = %72
  %82 = and i32 %70, -2
  br label %111

83:                                               ; preds = %111, %72
  %84 = phi float [ %78, %72 ], [ %155, %111 ]
  %85 = phi i32 [ 0, %72 ], [ %156, %111 ]
  %86 = icmp eq i32 %79, 0
  br i1 %86, label %108, label %87

87:                                               ; preds = %83
  %88 = add nsw i32 %85, %73
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %89
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !19, !amdgpu.noclobber !5
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %89
  %93 = load i32, i32 addrspace(1)* %92, align 4, !tbaa !19, !amdgpu.noclobber !5
  %94 = add i32 %91, %46
  %95 = mul i32 %94, %3
  %96 = add nsw i32 %95, %66
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %9, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !23
  %100 = mul i32 %28, %93
  %101 = add nsw i32 %100, %65
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %10, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !23
  %105 = fmul contract float %99, %104
  %106 = fdiv contract float %105, %74
  %107 = fadd contract float %84, %106
  store float %107, float addrspace(1)* %77, align 4, !tbaa !23
  br label %108

108:                                              ; preds = %87, %83, %59
  %109 = add i32 %54, %60
  %110 = icmp slt i32 %109, %29
  br i1 %110, label %59, label %55, !llvm.loop !25

111:                                              ; preds = %111, %81
  %112 = phi float [ %78, %81 ], [ %155, %111 ]
  %113 = phi i32 [ 0, %81 ], [ %156, %111 ]
  %114 = phi i32 [ 0, %81 ], [ %157, %111 ]
  %115 = add nsw i32 %113, %73
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %116
  %118 = load i32, i32 addrspace(1)* %117, align 4, !tbaa !19, !amdgpu.noclobber !5
  %119 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %116
  %120 = load i32, i32 addrspace(1)* %119, align 4, !tbaa !19, !amdgpu.noclobber !5
  %121 = add i32 %118, %46
  %122 = mul i32 %121, %3
  %123 = add nsw i32 %122, %66
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %9, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !23
  %127 = mul i32 %28, %120
  %128 = add nsw i32 %127, %65
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %10, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !23
  %132 = fmul contract float %126, %131
  %133 = fdiv contract float %132, %74
  %134 = fadd contract float %112, %133
  store float %134, float addrspace(1)* %77, align 4, !tbaa !23
  %135 = or i32 %113, 1
  %136 = add nsw i32 %135, %73
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %137
  %139 = load i32, i32 addrspace(1)* %138, align 4, !tbaa !19, !amdgpu.noclobber !5
  %140 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %137
  %141 = load i32, i32 addrspace(1)* %140, align 4, !tbaa !19, !amdgpu.noclobber !5
  %142 = add i32 %139, %46
  %143 = mul i32 %142, %3
  %144 = add nsw i32 %143, %66
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %9, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !23
  %148 = mul i32 %28, %141
  %149 = add nsw i32 %148, %65
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %10, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !23
  %153 = fmul contract float %147, %152
  %154 = fdiv contract float %153, %74
  %155 = fadd contract float %134, %154
  store float %155, float addrspace(1)* %77, align 4, !tbaa !23
  %156 = add nuw nsw i32 %113, 2
  %157 = add i32 %114, 2
  %158 = icmp eq i32 %157, %82
  br i1 %158, label %83, label %111, !llvm.loop !26
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!16 = !{!7, !11, i64 16}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!20, !20, i64 0}
!20 = !{!"int", !21, i64 0}
!21 = !{!"omnipotent char", !22, i64 0}
!22 = !{!"Simple C++ TBAA"}
!23 = !{!24, !24, i64 0}
!24 = !{!"float", !21, i64 0}
!25 = distinct !{!25, !18}
!26 = distinct !{!26, !18}
