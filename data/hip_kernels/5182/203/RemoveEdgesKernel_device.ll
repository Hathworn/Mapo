; ModuleID = '../data/hip_kernels/5182/203/main.cu'
source_filename = "../data/hip_kernels/5182/203/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17RemoveEdgesKernelPiS_iS_PfS_S0_S0_S_i(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 addrspace(1)* nocapture %3, float addrspace(1)* nocapture writeonly %4, i32 addrspace(1)* nocapture writeonly %5, float addrspace(1)* nocapture writeonly %6, float addrspace(1)* nocapture writeonly %7, i32 addrspace(1)* nocapture %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !6
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = udiv i32 %18, %15
  %22 = mul i32 %21, %15
  %23 = icmp ugt i32 %18, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = mul i32 %25, %20
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %28 = add i32 %26, %19
  %29 = mul i32 %28, %15
  %30 = add i32 %29, %27
  %31 = icmp slt i32 %30, %9
  br i1 %31, label %32, label %148

32:                                               ; preds = %10
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !16, !amdgpu.noclobber !5
  %36 = icmp eq i32 %35, 1
  br i1 %36, label %37, label %148

37:                                               ; preds = %32
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %33
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !16, !amdgpu.noclobber !5
  %40 = add nsw i32 %39, 1
  store i32 %40, i32 addrspace(1)* %38, align 4, !tbaa !16
  %41 = icmp sgt i32 %9, 0
  br i1 %41, label %42, label %74

42:                                               ; preds = %37
  %43 = mul nsw i32 %30, %9
  %44 = and i32 %9, 3
  %45 = icmp ult i32 %9, 4
  br i1 %45, label %48, label %46

46:                                               ; preds = %42
  %47 = and i32 %9, -4
  br label %77

48:                                               ; preds = %138, %42
  %49 = phi i32 [ undef, %42 ], [ %139, %138 ]
  %50 = phi i32 [ 0, %42 ], [ %140, %138 ]
  %51 = phi i32 [ 0, %42 ], [ %139, %138 ]
  %52 = icmp eq i32 %44, 0
  br i1 %52, label %74, label %53

53:                                               ; preds = %48, %69
  %54 = phi i32 [ %71, %69 ], [ %50, %48 ]
  %55 = phi i32 [ %70, %69 ], [ %51, %48 ]
  %56 = phi i32 [ %72, %69 ], [ 0, %48 ]
  %57 = add nsw i32 %54, %43
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %58
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !16
  %61 = icmp eq i32 %60, 1
  br i1 %61, label %62, label %69

62:                                               ; preds = %53
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %58
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !16
  %65 = icmp sgt i32 %64, %2
  br i1 %65, label %68, label %66

66:                                               ; preds = %62
  %67 = add nsw i32 %55, 1
  br label %69

68:                                               ; preds = %62
  store i32 0, i32 addrspace(1)* %59, align 4, !tbaa !16
  store i32 0, i32 addrspace(1)* %63, align 4, !tbaa !16
  br label %69

69:                                               ; preds = %68, %66, %53
  %70 = phi i32 [ %67, %66 ], [ %55, %68 ], [ %55, %53 ]
  %71 = add nuw nsw i32 %54, 1
  %72 = add i32 %56, 1
  %73 = icmp eq i32 %72, %44
  br i1 %73, label %74, label %53, !llvm.loop !20

74:                                               ; preds = %48, %69, %37
  %75 = phi i32 [ 0, %37 ], [ %49, %48 ], [ %70, %69 ]
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %143, label %148

77:                                               ; preds = %138, %46
  %78 = phi i32 [ 0, %46 ], [ %140, %138 ]
  %79 = phi i32 [ 0, %46 ], [ %139, %138 ]
  %80 = phi i32 [ 0, %46 ], [ %141, %138 ]
  %81 = add nsw i32 %78, %43
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %82
  %84 = load i32, i32 addrspace(1)* %83, align 4, !tbaa !16
  %85 = icmp eq i32 %84, 1
  br i1 %85, label %86, label %93

86:                                               ; preds = %77
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %82
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !16
  %89 = icmp sgt i32 %88, %2
  br i1 %89, label %92, label %90

90:                                               ; preds = %86
  %91 = add nsw i32 %79, 1
  br label %93

92:                                               ; preds = %86
  store i32 0, i32 addrspace(1)* %83, align 4, !tbaa !16
  store i32 0, i32 addrspace(1)* %87, align 4, !tbaa !16
  br label %93

93:                                               ; preds = %77, %92, %90
  %94 = phi i32 [ %91, %90 ], [ %79, %92 ], [ %79, %77 ]
  %95 = or i32 %78, 1
  %96 = add nsw i32 %95, %43
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %97
  %99 = load i32, i32 addrspace(1)* %98, align 4, !tbaa !16
  %100 = icmp eq i32 %99, 1
  br i1 %100, label %101, label %108

101:                                              ; preds = %93
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %97
  %103 = load i32, i32 addrspace(1)* %102, align 4, !tbaa !16
  %104 = icmp sgt i32 %103, %2
  br i1 %104, label %107, label %105

105:                                              ; preds = %101
  %106 = add nsw i32 %94, 1
  br label %108

107:                                              ; preds = %101
  store i32 0, i32 addrspace(1)* %98, align 4, !tbaa !16
  store i32 0, i32 addrspace(1)* %102, align 4, !tbaa !16
  br label %108

108:                                              ; preds = %107, %105, %93
  %109 = phi i32 [ %106, %105 ], [ %94, %107 ], [ %94, %93 ]
  %110 = or i32 %78, 2
  %111 = add nsw i32 %110, %43
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %112
  %114 = load i32, i32 addrspace(1)* %113, align 4, !tbaa !16
  %115 = icmp eq i32 %114, 1
  br i1 %115, label %116, label %123

116:                                              ; preds = %108
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %112
  %118 = load i32, i32 addrspace(1)* %117, align 4, !tbaa !16
  %119 = icmp sgt i32 %118, %2
  br i1 %119, label %122, label %120

120:                                              ; preds = %116
  %121 = add nsw i32 %109, 1
  br label %123

122:                                              ; preds = %116
  store i32 0, i32 addrspace(1)* %113, align 4, !tbaa !16
  store i32 0, i32 addrspace(1)* %117, align 4, !tbaa !16
  br label %123

123:                                              ; preds = %122, %120, %108
  %124 = phi i32 [ %121, %120 ], [ %109, %122 ], [ %109, %108 ]
  %125 = or i32 %78, 3
  %126 = add nsw i32 %125, %43
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %127
  %129 = load i32, i32 addrspace(1)* %128, align 4, !tbaa !16
  %130 = icmp eq i32 %129, 1
  br i1 %130, label %131, label %138

131:                                              ; preds = %123
  %132 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %127
  %133 = load i32, i32 addrspace(1)* %132, align 4, !tbaa !16
  %134 = icmp sgt i32 %133, %2
  br i1 %134, label %137, label %135

135:                                              ; preds = %131
  %136 = add nsw i32 %124, 1
  br label %138

137:                                              ; preds = %131
  store i32 0, i32 addrspace(1)* %128, align 4, !tbaa !16
  store i32 0, i32 addrspace(1)* %132, align 4, !tbaa !16
  br label %138

138:                                              ; preds = %137, %135, %123
  %139 = phi i32 [ %136, %135 ], [ %124, %137 ], [ %124, %123 ]
  %140 = add nuw nsw i32 %78, 4
  %141 = add i32 %80, 4
  %142 = icmp eq i32 %141, %47
  br i1 %142, label %48, label %77, !llvm.loop !22

143:                                              ; preds = %74
  store i32 0, i32 addrspace(1)* %34, align 4, !tbaa !16
  %144 = getelementptr inbounds float, float addrspace(1)* %7, i64 %33
  store float 0.000000e+00, float addrspace(1)* %144, align 4, !tbaa !24
  store i32 0, i32 addrspace(1)* %38, align 4, !tbaa !16
  %145 = getelementptr inbounds float, float addrspace(1)* %4, i64 %33
  store float 0.000000e+00, float addrspace(1)* %145, align 4, !tbaa !24
  %146 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %33
  store i32 0, i32 addrspace(1)* %146, align 4, !tbaa !16
  %147 = getelementptr inbounds float, float addrspace(1)* %6, i64 %33
  store float 0.000000e+00, float addrspace(1)* %147, align 4, !tbaa !24
  br label %148

148:                                              ; preds = %74, %143, %32, %10
  ret void
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
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = !{!25, !25, i64 0}
!25 = !{!"float", !18, i64 0}
