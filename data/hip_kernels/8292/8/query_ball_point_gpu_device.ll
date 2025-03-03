; ModuleID = '../data/hip_kernels/8292/8/main.cu'
source_filename = "../data/hip_kernels/8292/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20query_ball_point_gpuiiiPKfiS0_S0_Pi(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
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

27:                                               ; preds = %10, %50
  %28 = phi float addrspace(1)* [ %5, %10 ], [ %51, %50 ]
  %29 = phi float addrspace(1)* [ %6, %10 ], [ %52, %50 ]
  %30 = phi i32 addrspace(1)* [ %7, %10 ], [ %53, %50 ]
  %31 = phi i32 [ 0, %10 ], [ %54, %50 ]
  br i1 %11, label %33, label %50

32:                                               ; preds = %50, %8
  ret void

33:                                               ; preds = %27, %165
  %34 = phi i32 [ %166, %165 ], [ 0, %27 ]
  br i1 %14, label %165, label %35

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
  %48 = load float, float addrspace(1)* %3, align 4, !tbaa !4, !amdgpu.noclobber !8
  %49 = mul nsw i32 %34, %4
  br label %56

50:                                               ; preds = %165, %27
  %51 = getelementptr inbounds float, float addrspace(1)* %28, i64 %17
  %52 = getelementptr inbounds float, float addrspace(1)* %29, i64 %19
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %30, i64 %21
  %54 = add nuw nsw i32 %31, 1
  %55 = icmp eq i32 %54, %0
  br i1 %55, label %32, label %27, !llvm.loop !9

56:                                               ; preds = %35, %159
  %57 = phi i32 [ 0, %35 ], [ %160, %159 ]
  %58 = phi i32 [ 0, %35 ], [ %161, %159 ]
  %59 = mul nuw nsw i32 %58, 3
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %28, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !4
  %63 = add nuw nsw i32 %59, 1
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %28, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !4
  %67 = add nuw nsw i32 %59, 2
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %28, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !4
  %71 = fsub contract float %39, %62
  %72 = fmul contract float %71, %71
  %73 = fsub contract float %43, %66
  %74 = fmul contract float %73, %73
  %75 = fadd contract float %72, %74
  %76 = fsub contract float %47, %70
  %77 = fmul contract float %76, %76
  %78 = fadd contract float %75, %77
  %79 = fcmp olt float %78, 0x39F0000000000000
  %80 = select i1 %79, float 0x41F0000000000000, float 1.000000e+00
  %81 = fmul float %78, %80
  %82 = tail call float @llvm.sqrt.f32(float %81)
  %83 = bitcast float %82 to i32
  %84 = add nsw i32 %83, -1
  %85 = bitcast i32 %84 to float
  %86 = add nsw i32 %83, 1
  %87 = bitcast i32 %86 to float
  %88 = tail call i1 @llvm.amdgcn.class.f32(float %81, i32 608)
  %89 = select i1 %79, float 0x3EF0000000000000, float 1.000000e+00
  %90 = fneg float %87
  %91 = tail call float @llvm.fma.f32(float %90, float %82, float %81)
  %92 = fcmp ogt float %91, 0.000000e+00
  %93 = fneg float %85
  %94 = tail call float @llvm.fma.f32(float %93, float %82, float %81)
  %95 = fcmp ole float %94, 0.000000e+00
  %96 = select i1 %95, float %85, float %82
  %97 = select i1 %92, float %87, float %96
  %98 = fmul float %89, %97
  %99 = select i1 %88, float %81, float %98
  %100 = tail call float @llvm.maxnum.f32(float %99, float 0x3BC79CA100000000)
  %101 = fcmp contract olt float %100, %48
  br i1 %101, label %102, label %159

102:                                              ; preds = %56
  %103 = icmp ne i32 %57, 0
  %104 = select i1 %103, i1 true, i1 %15
  br i1 %104, label %154, label %105

105:                                              ; preds = %102
  br i1 %24, label %143, label %106

106:                                              ; preds = %105, %106
  %107 = phi i32 [ %140, %106 ], [ 0, %105 ]
  %108 = phi i32 [ %141, %106 ], [ 0, %105 ]
  %109 = add nsw i32 %107, %49
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %30, i64 %110
  store i32 %58, i32 addrspace(1)* %111, align 4, !tbaa !11
  %112 = or i32 %107, 1
  %113 = add nsw i32 %112, %49
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i32, i32 addrspace(1)* %30, i64 %114
  store i32 %58, i32 addrspace(1)* %115, align 4, !tbaa !11
  %116 = or i32 %107, 2
  %117 = add nsw i32 %116, %49
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i32, i32 addrspace(1)* %30, i64 %118
  store i32 %58, i32 addrspace(1)* %119, align 4, !tbaa !11
  %120 = or i32 %107, 3
  %121 = add nsw i32 %120, %49
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i32, i32 addrspace(1)* %30, i64 %122
  store i32 %58, i32 addrspace(1)* %123, align 4, !tbaa !11
  %124 = or i32 %107, 4
  %125 = add nsw i32 %124, %49
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i32, i32 addrspace(1)* %30, i64 %126
  store i32 %58, i32 addrspace(1)* %127, align 4, !tbaa !11
  %128 = or i32 %107, 5
  %129 = add nsw i32 %128, %49
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i32, i32 addrspace(1)* %30, i64 %130
  store i32 %58, i32 addrspace(1)* %131, align 4, !tbaa !11
  %132 = or i32 %107, 6
  %133 = add nsw i32 %132, %49
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds i32, i32 addrspace(1)* %30, i64 %134
  store i32 %58, i32 addrspace(1)* %135, align 4, !tbaa !11
  %136 = or i32 %107, 7
  %137 = add nsw i32 %136, %49
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds i32, i32 addrspace(1)* %30, i64 %138
  store i32 %58, i32 addrspace(1)* %139, align 4, !tbaa !11
  %140 = add nuw nsw i32 %107, 8
  %141 = add i32 %108, 8
  %142 = icmp eq i32 %141, %25
  br i1 %142, label %143, label %106, !llvm.loop !13

143:                                              ; preds = %106, %105
  %144 = phi i32 [ 0, %105 ], [ %140, %106 ]
  br i1 %26, label %154, label %145

145:                                              ; preds = %143, %145
  %146 = phi i32 [ %151, %145 ], [ %144, %143 ]
  %147 = phi i32 [ %152, %145 ], [ 0, %143 ]
  %148 = add nsw i32 %146, %49
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds i32, i32 addrspace(1)* %30, i64 %149
  store i32 %58, i32 addrspace(1)* %150, align 4, !tbaa !11
  %151 = add nuw nsw i32 %146, 1
  %152 = add i32 %147, 1
  %153 = icmp eq i32 %152, %23
  br i1 %153, label %154, label %145, !llvm.loop !14

154:                                              ; preds = %143, %145, %102
  %155 = add nsw i32 %57, %49
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds i32, i32 addrspace(1)* %30, i64 %156
  store i32 %58, i32 addrspace(1)* %157, align 4, !tbaa !11
  %158 = add nsw i32 %57, 1
  br label %159

159:                                              ; preds = %154, %56
  %160 = phi i32 [ %158, %154 ], [ %57, %56 ]
  %161 = add nuw nsw i32 %58, 1
  %162 = icmp sge i32 %161, %1
  %163 = icmp eq i32 %160, %4
  %164 = select i1 %162, i1 true, i1 %163
  br i1 %164, label %165, label %56, !llvm.loop !16

165:                                              ; preds = %159, %33
  %166 = add nuw nsw i32 %34, 1
  %167 = icmp eq i32 %166, %2
  br i1 %167, label %50, label %33, !llvm.loop !17
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
!8 = !{}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !6, i64 0}
!13 = distinct !{!13, !10}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = distinct !{!16, !10}
!17 = distinct !{!17, !10}
