; ModuleID = '../data/hip_kernels/7072/13/main.cu'
source_filename = "../data/hip_kernels/7072/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20query_ball_point_gpuiiifiPKfS0_Pi(i32 %0, i32 %1, i32 %2, float %3, i32 %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %10, label %32

10:                                               ; preds = %8
  %11 = icmp sgt i32 %2, 0
  %12 = icmp slt i32 %1, 1
  %13 = icmp eq i32 %4, 0
  %14 = select i1 %12, i1 true, i1 %13
  %15 = icmp slt i32 %4, 1
  %16 = mul nsw i32 %1, 3
  %17 = sext i32 %16 to i64
  %18 = mul nsw i32 %2, 3
  %19 = sext i32 %18 to i64
  %20 = mul nsw i32 %4, %2
  %21 = sext i32 %20 to i64
  %22 = add i32 %4, -1
  %23 = and i32 %4, 7
  %24 = icmp ult i32 %22, 7
  %25 = and i32 %4, -8
  %26 = icmp eq i32 %23, 0
  br label %27

27:                                               ; preds = %10, %49
  %28 = phi float addrspace(1)* [ %5, %10 ], [ %50, %49 ]
  %29 = phi float addrspace(1)* [ %6, %10 ], [ %51, %49 ]
  %30 = phi i32 addrspace(1)* [ %7, %10 ], [ %52, %49 ]
  %31 = phi i32 [ 0, %10 ], [ %53, %49 ]
  br i1 %11, label %33, label %49

32:                                               ; preds = %49, %8
  ret void

33:                                               ; preds = %27, %164
  %34 = phi i32 [ %165, %164 ], [ 0, %27 ]
  br i1 %14, label %164, label %35

35:                                               ; preds = %33
  %36 = mul nsw i32 %34, 3
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %29, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !4
  %40 = add nuw nsw i32 %36, 1
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %29, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !4
  %44 = add nuw nsw i32 %36, 2
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %29, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !4
  %48 = mul nsw i32 %34, %4
  br label %55

49:                                               ; preds = %164, %27
  %50 = getelementptr inbounds float, float addrspace(1)* %28, i64 %17
  %51 = getelementptr inbounds float, float addrspace(1)* %29, i64 %19
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %30, i64 %21
  %53 = add nuw nsw i32 %31, 1
  %54 = icmp eq i32 %53, %0
  br i1 %54, label %32, label %27, !llvm.loop !8

55:                                               ; preds = %35, %158
  %56 = phi i32 [ 0, %35 ], [ %159, %158 ]
  %57 = phi i32 [ 0, %35 ], [ %160, %158 ]
  %58 = mul nuw nsw i32 %57, 3
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %28, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !4
  %62 = add nuw nsw i32 %58, 1
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %28, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !4
  %66 = add nuw nsw i32 %58, 2
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %28, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !4
  %70 = fsub contract float %39, %61
  %71 = fmul contract float %70, %70
  %72 = fsub contract float %43, %65
  %73 = fmul contract float %72, %72
  %74 = fadd contract float %71, %73
  %75 = fsub contract float %47, %69
  %76 = fmul contract float %75, %75
  %77 = fadd contract float %74, %76
  %78 = fcmp olt float %77, 0x39F0000000000000
  %79 = select i1 %78, float 0x41F0000000000000, float 1.000000e+00
  %80 = fmul float %77, %79
  %81 = tail call float @llvm.sqrt.f32(float %80)
  %82 = bitcast float %81 to i32
  %83 = add nsw i32 %82, -1
  %84 = bitcast i32 %83 to float
  %85 = add nsw i32 %82, 1
  %86 = bitcast i32 %85 to float
  %87 = tail call i1 @llvm.amdgcn.class.f32(float %80, i32 608)
  %88 = select i1 %78, float 0x3EF0000000000000, float 1.000000e+00
  %89 = fneg float %86
  %90 = tail call float @llvm.fma.f32(float %89, float %81, float %80)
  %91 = fcmp ogt float %90, 0.000000e+00
  %92 = fneg float %84
  %93 = tail call float @llvm.fma.f32(float %92, float %81, float %80)
  %94 = fcmp ole float %93, 0.000000e+00
  %95 = select i1 %94, float %84, float %81
  %96 = select i1 %91, float %86, float %95
  %97 = fmul float %88, %96
  %98 = select i1 %87, float %80, float %97
  %99 = tail call float @llvm.maxnum.f32(float %98, float 0x3BC79CA100000000)
  %100 = fcmp contract olt float %99, %3
  br i1 %100, label %101, label %158

101:                                              ; preds = %55
  %102 = icmp ne i32 %56, 0
  %103 = select i1 %102, i1 true, i1 %15
  br i1 %103, label %153, label %104

104:                                              ; preds = %101
  br i1 %24, label %142, label %105

105:                                              ; preds = %104, %105
  %106 = phi i32 [ %139, %105 ], [ 0, %104 ]
  %107 = phi i32 [ %140, %105 ], [ 0, %104 ]
  %108 = add nsw i32 %106, %48
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %30, i64 %109
  store i32 %57, i32 addrspace(1)* %110, align 4, !tbaa !10
  %111 = or i32 %106, 1
  %112 = add nsw i32 %111, %48
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds i32, i32 addrspace(1)* %30, i64 %113
  store i32 %57, i32 addrspace(1)* %114, align 4, !tbaa !10
  %115 = or i32 %106, 2
  %116 = add nsw i32 %115, %48
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i32, i32 addrspace(1)* %30, i64 %117
  store i32 %57, i32 addrspace(1)* %118, align 4, !tbaa !10
  %119 = or i32 %106, 3
  %120 = add nsw i32 %119, %48
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds i32, i32 addrspace(1)* %30, i64 %121
  store i32 %57, i32 addrspace(1)* %122, align 4, !tbaa !10
  %123 = or i32 %106, 4
  %124 = add nsw i32 %123, %48
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i32, i32 addrspace(1)* %30, i64 %125
  store i32 %57, i32 addrspace(1)* %126, align 4, !tbaa !10
  %127 = or i32 %106, 5
  %128 = add nsw i32 %127, %48
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds i32, i32 addrspace(1)* %30, i64 %129
  store i32 %57, i32 addrspace(1)* %130, align 4, !tbaa !10
  %131 = or i32 %106, 6
  %132 = add nsw i32 %131, %48
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i32, i32 addrspace(1)* %30, i64 %133
  store i32 %57, i32 addrspace(1)* %134, align 4, !tbaa !10
  %135 = or i32 %106, 7
  %136 = add nsw i32 %135, %48
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i32, i32 addrspace(1)* %30, i64 %137
  store i32 %57, i32 addrspace(1)* %138, align 4, !tbaa !10
  %139 = add nuw nsw i32 %106, 8
  %140 = add i32 %107, 8
  %141 = icmp eq i32 %140, %25
  br i1 %141, label %142, label %105, !llvm.loop !12

142:                                              ; preds = %105, %104
  %143 = phi i32 [ 0, %104 ], [ %139, %105 ]
  br i1 %26, label %153, label %144

144:                                              ; preds = %142, %144
  %145 = phi i32 [ %150, %144 ], [ %143, %142 ]
  %146 = phi i32 [ %151, %144 ], [ 0, %142 ]
  %147 = add nsw i32 %145, %48
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i32, i32 addrspace(1)* %30, i64 %148
  store i32 %57, i32 addrspace(1)* %149, align 4, !tbaa !10
  %150 = add nuw nsw i32 %145, 1
  %151 = add i32 %146, 1
  %152 = icmp eq i32 %151, %23
  br i1 %152, label %153, label %144, !llvm.loop !13

153:                                              ; preds = %142, %144, %101
  %154 = add nsw i32 %56, %48
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i32, i32 addrspace(1)* %30, i64 %155
  store i32 %57, i32 addrspace(1)* %156, align 4, !tbaa !10
  %157 = add nsw i32 %56, 1
  br label %158

158:                                              ; preds = %153, %55
  %159 = phi i32 [ %157, %153 ], [ %56, %55 ]
  %160 = add nuw nsw i32 %57, 1
  %161 = icmp sge i32 %160, %1
  %162 = icmp eq i32 %159, %4
  %163 = select i1 %161, i1 true, i1 %162
  br i1 %163, label %164, label %55, !llvm.loop !15

164:                                              ; preds = %158, %33
  %165 = add nuw nsw i32 %34, 1
  %166 = icmp eq i32 %165, %2
  br i1 %166, label %49, label %33, !llvm.loop !16
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !6, i64 0}
!12 = distinct !{!12, !9}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !9}
!16 = distinct !{!16, !9}
