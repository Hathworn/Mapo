; ModuleID = '../data/hip_kernels/18288/4/main.cu'
source_filename = "../data/hip_kernels/18288/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18max_pool3d_forwardiiiiiPKiS0_PKfPfPi(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture %8, i32 addrspace(1)* nocapture writeonly %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = icmp slt i32 %11, %0
  br i1 %12, label %13, label %29

13:                                               ; preds = %10
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = mul nsw i32 %3, %2
  %16 = icmp slt i32 %14, %15
  %17 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = getelementptr inbounds i8, i8 addrspace(4)* %17, i64 12
  %21 = bitcast i8 addrspace(4)* %20 to i32 addrspace(4)*
  %22 = load i32, i32 addrspace(4)* %21, align 4, !tbaa !5
  %23 = load i16, i16 addrspace(4)* %19, align 4, !range !14, !invariant.load !15
  %24 = zext i16 %23 to i32
  %25 = udiv i32 %22, %24
  %26 = mul i32 %25, %24
  %27 = icmp ugt i32 %22, %26
  %28 = zext i1 %27 to i32
  br label %30

29:                                               ; preds = %37, %10
  ret void

30:                                               ; preds = %13, %37
  %31 = phi float [ undef, %13 ], [ %38, %37 ]
  %32 = phi i32 [ %11, %13 ], [ %40, %37 ]
  br i1 %16, label %33, label %37

33:                                               ; preds = %30
  %34 = mul nsw i32 %32, %2
  %35 = mul nsw i32 %32, %1
  %36 = mul nsw i32 %34, %3
  br label %42

37:                                               ; preds = %104, %30
  %38 = phi float [ %31, %30 ], [ %105, %104 ]
  %39 = add i32 %25, %32
  %40 = add i32 %39, %28
  %41 = icmp slt i32 %40, %0
  br i1 %41, label %30, label %29, !llvm.loop !16

42:                                               ; preds = %33, %104
  %43 = phi float [ %31, %33 ], [ %105, %104 ]
  %44 = phi i32 [ %14, %33 ], [ %106, %104 ]
  %45 = freeze i32 %44
  %46 = freeze i32 %3
  %47 = sdiv i32 %45, %46
  %48 = mul i32 %47, %46
  %49 = sub i32 %45, %48
  %50 = add nsw i32 %47, %34
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !18
  %54 = icmp sgt i32 %53, 0
  br i1 %54, label %55, label %104

55:                                               ; preds = %42
  %56 = mul i32 %50, %4
  %57 = add nsw i32 %44, %36
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %8, i64 %58
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %58
  %61 = sext i32 %56 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %61
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !18
  %64 = add i32 %63, %35
  %65 = mul i32 %64, %3
  %66 = add nsw i32 %65, %49
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %7, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !22
  store float %69, float addrspace(1)* %59, align 4, !tbaa !22
  store i32 %63, i32 addrspace(1)* %60, align 4, !tbaa !18
  %70 = icmp eq i32 %53, 1
  br i1 %70, label %104, label %71

71:                                               ; preds = %55
  %72 = add i32 %53, -1
  %73 = add i32 %53, -2
  %74 = and i32 %72, 3
  %75 = icmp ult i32 %73, 3
  br i1 %75, label %78, label %76

76:                                               ; preds = %71
  %77 = and i32 %72, -4
  br label %108

78:                                               ; preds = %169, %71
  %79 = phi float [ undef, %71 ], [ %170, %169 ]
  %80 = phi float [ %69, %71 ], [ %170, %169 ]
  %81 = phi i32 [ 1, %71 ], [ %171, %169 ]
  %82 = icmp eq i32 %74, 0
  br i1 %82, label %104, label %83

83:                                               ; preds = %78, %99
  %84 = phi float [ %100, %99 ], [ %80, %78 ]
  %85 = phi i32 [ %101, %99 ], [ %81, %78 ]
  %86 = phi i32 [ %102, %99 ], [ 0, %78 ]
  %87 = add nsw i32 %85, %56
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %88
  %90 = load i32, i32 addrspace(1)* %89, align 4, !tbaa !18
  %91 = add i32 %90, %35
  %92 = mul i32 %91, %3
  %93 = add nsw i32 %92, %49
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %7, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !22
  %97 = fcmp contract ogt float %96, %84
  br i1 %97, label %98, label %99

98:                                               ; preds = %83
  store float %96, float addrspace(1)* %59, align 4, !tbaa !22
  store i32 %90, i32 addrspace(1)* %60, align 4, !tbaa !18
  br label %99

99:                                               ; preds = %98, %83
  %100 = phi float [ %84, %83 ], [ %96, %98 ]
  %101 = add nuw nsw i32 %85, 1
  %102 = add i32 %86, 1
  %103 = icmp eq i32 %102, %74
  br i1 %103, label %104, label %83, !llvm.loop !24

104:                                              ; preds = %78, %99, %55, %42
  %105 = phi float [ %43, %42 ], [ %69, %55 ], [ %79, %78 ], [ %100, %99 ]
  %106 = add i32 %44, %24
  %107 = icmp slt i32 %106, %15
  br i1 %107, label %42, label %37, !llvm.loop !26

108:                                              ; preds = %169, %76
  %109 = phi float [ %69, %76 ], [ %170, %169 ]
  %110 = phi i32 [ 1, %76 ], [ %171, %169 ]
  %111 = phi i32 [ 0, %76 ], [ %172, %169 ]
  %112 = add nsw i32 %110, %56
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %113
  %115 = load i32, i32 addrspace(1)* %114, align 4, !tbaa !18
  %116 = add i32 %115, %35
  %117 = mul i32 %116, %3
  %118 = add nsw i32 %117, %49
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %7, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !22
  %122 = fcmp contract ogt float %121, %109
  br i1 %122, label %123, label %124

123:                                              ; preds = %108
  store float %121, float addrspace(1)* %59, align 4, !tbaa !22
  store i32 %115, i32 addrspace(1)* %60, align 4, !tbaa !18
  br label %124

124:                                              ; preds = %108, %123
  %125 = phi float [ %109, %108 ], [ %121, %123 ]
  %126 = add nuw nsw i32 %110, 1
  %127 = add nsw i32 %126, %56
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %128
  %130 = load i32, i32 addrspace(1)* %129, align 4, !tbaa !18
  %131 = add i32 %130, %35
  %132 = mul i32 %131, %3
  %133 = add nsw i32 %132, %49
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %7, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !22
  %137 = fcmp contract ogt float %136, %125
  br i1 %137, label %138, label %139

138:                                              ; preds = %124
  store float %136, float addrspace(1)* %59, align 4, !tbaa !22
  store i32 %130, i32 addrspace(1)* %60, align 4, !tbaa !18
  br label %139

139:                                              ; preds = %138, %124
  %140 = phi float [ %125, %124 ], [ %136, %138 ]
  %141 = add nuw nsw i32 %110, 2
  %142 = add nsw i32 %141, %56
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %143
  %145 = load i32, i32 addrspace(1)* %144, align 4, !tbaa !18
  %146 = add i32 %145, %35
  %147 = mul i32 %146, %3
  %148 = add nsw i32 %147, %49
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %7, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !22
  %152 = fcmp contract ogt float %151, %140
  br i1 %152, label %153, label %154

153:                                              ; preds = %139
  store float %151, float addrspace(1)* %59, align 4, !tbaa !22
  store i32 %145, i32 addrspace(1)* %60, align 4, !tbaa !18
  br label %154

154:                                              ; preds = %153, %139
  %155 = phi float [ %140, %139 ], [ %151, %153 ]
  %156 = add nuw nsw i32 %110, 3
  %157 = add nsw i32 %156, %56
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %158
  %160 = load i32, i32 addrspace(1)* %159, align 4, !tbaa !18
  %161 = add i32 %160, %35
  %162 = mul i32 %161, %3
  %163 = add nsw i32 %162, %49
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %7, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !22
  %167 = fcmp contract ogt float %166, %155
  br i1 %167, label %168, label %169

168:                                              ; preds = %154
  store float %166, float addrspace(1)* %59, align 4, !tbaa !22
  store i32 %160, i32 addrspace(1)* %60, align 4, !tbaa !18
  br label %169

169:                                              ; preds = %168, %154
  %170 = phi float [ %155, %154 ], [ %166, %168 ]
  %171 = add nuw nsw i32 %110, 4
  %172 = add i32 %111, 4
  %173 = icmp eq i32 %172, %77
  br i1 %173, label %78, label %108, !llvm.loop !27
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
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!19, !19, i64 0}
!19 = !{!"int", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
!22 = !{!23, !23, i64 0}
!23 = !{!"float", !20, i64 0}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.unroll.disable"}
!26 = distinct !{!26, !17}
!27 = distinct !{!27, !17, !28}
!28 = !{!"llvm.loop.peeled.count", i32 1}
