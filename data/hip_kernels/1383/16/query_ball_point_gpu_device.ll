; ModuleID = '../data/hip_kernels/1383/16/main.cu'
source_filename = "../data/hip_kernels/1383/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20query_ball_point_gpuiiifiPKfS0_Pi(i32 %0, i32 %1, i32 %2, float %3, i32 %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = mul nuw nsw i32 %9, 3
  %11 = mul i32 %10, %1
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %5, i64 %12
  %14 = mul i32 %10, %2
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %6, i64 %15
  %17 = mul i32 %9, %2
  %18 = mul i32 %17, %4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %19
  %21 = icmp sgt i32 %2, 0
  br i1 %21, label %22, label %48

22:                                               ; preds = %8
  %23 = icmp slt i32 %1, 1
  %24 = icmp eq i32 %4, 0
  %25 = select i1 %23, i1 true, i1 %24
  %26 = icmp slt i32 %4, 1
  %27 = add i32 %4, -1
  %28 = and i32 %4, 7
  %29 = icmp ult i32 %27, 7
  %30 = and i32 %4, -8
  %31 = icmp eq i32 %28, 0
  br label %32

32:                                               ; preds = %22, %158
  %33 = phi i32 [ 0, %22 ], [ %159, %158 ]
  br i1 %25, label %158, label %34

34:                                               ; preds = %32
  %35 = mul nsw i32 %33, 3
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %16, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !5, !amdgpu.noclobber !9
  %39 = add nuw nsw i32 %35, 1
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %16, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !5, !amdgpu.noclobber !9
  %43 = add nuw nsw i32 %35, 2
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %16, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !5, !amdgpu.noclobber !9
  %47 = mul nsw i32 %33, %4
  br label %49

48:                                               ; preds = %158, %8
  ret void

49:                                               ; preds = %34, %152
  %50 = phi i32 [ 0, %34 ], [ %153, %152 ]
  %51 = phi i32 [ 0, %34 ], [ %154, %152 ]
  %52 = mul nuw nsw i32 %51, 3
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %13, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !5, !amdgpu.noclobber !9
  %56 = add nuw nsw i32 %52, 1
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %13, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !5, !amdgpu.noclobber !9
  %60 = add nuw nsw i32 %52, 2
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %13, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !5, !amdgpu.noclobber !9
  %64 = fsub contract float %38, %55
  %65 = fmul contract float %64, %64
  %66 = fsub contract float %42, %59
  %67 = fmul contract float %66, %66
  %68 = fadd contract float %65, %67
  %69 = fsub contract float %46, %63
  %70 = fmul contract float %69, %69
  %71 = fadd contract float %68, %70
  %72 = fcmp olt float %71, 0x39F0000000000000
  %73 = select i1 %72, float 0x41F0000000000000, float 1.000000e+00
  %74 = fmul float %71, %73
  %75 = tail call float @llvm.sqrt.f32(float %74)
  %76 = bitcast float %75 to i32
  %77 = add nsw i32 %76, -1
  %78 = bitcast i32 %77 to float
  %79 = add nsw i32 %76, 1
  %80 = bitcast i32 %79 to float
  %81 = tail call i1 @llvm.amdgcn.class.f32(float %74, i32 608)
  %82 = select i1 %72, float 0x3EF0000000000000, float 1.000000e+00
  %83 = fneg float %80
  %84 = tail call float @llvm.fma.f32(float %83, float %75, float %74)
  %85 = fcmp ogt float %84, 0.000000e+00
  %86 = fneg float %78
  %87 = tail call float @llvm.fma.f32(float %86, float %75, float %74)
  %88 = fcmp ole float %87, 0.000000e+00
  %89 = select i1 %88, float %78, float %75
  %90 = select i1 %85, float %80, float %89
  %91 = fmul float %82, %90
  %92 = select i1 %81, float %74, float %91
  %93 = tail call float @llvm.maxnum.f32(float %92, float 0x3BC79CA100000000)
  %94 = fcmp contract olt float %93, %3
  br i1 %94, label %95, label %152

95:                                               ; preds = %49
  %96 = icmp ne i32 %50, 0
  %97 = select i1 %96, i1 true, i1 %26
  br i1 %97, label %147, label %98

98:                                               ; preds = %95
  br i1 %29, label %136, label %99

99:                                               ; preds = %98, %99
  %100 = phi i32 [ %133, %99 ], [ 0, %98 ]
  %101 = phi i32 [ %134, %99 ], [ 0, %98 ]
  %102 = add nsw i32 %100, %47
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %103
  store i32 %51, i32 addrspace(1)* %104, align 4, !tbaa !10
  %105 = or i32 %100, 1
  %106 = add nsw i32 %105, %47
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %107
  store i32 %51, i32 addrspace(1)* %108, align 4, !tbaa !10
  %109 = or i32 %100, 2
  %110 = add nsw i32 %109, %47
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %111
  store i32 %51, i32 addrspace(1)* %112, align 4, !tbaa !10
  %113 = or i32 %100, 3
  %114 = add nsw i32 %113, %47
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %115
  store i32 %51, i32 addrspace(1)* %116, align 4, !tbaa !10
  %117 = or i32 %100, 4
  %118 = add nsw i32 %117, %47
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %119
  store i32 %51, i32 addrspace(1)* %120, align 4, !tbaa !10
  %121 = or i32 %100, 5
  %122 = add nsw i32 %121, %47
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %123
  store i32 %51, i32 addrspace(1)* %124, align 4, !tbaa !10
  %125 = or i32 %100, 6
  %126 = add nsw i32 %125, %47
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %127
  store i32 %51, i32 addrspace(1)* %128, align 4, !tbaa !10
  %129 = or i32 %100, 7
  %130 = add nsw i32 %129, %47
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %131
  store i32 %51, i32 addrspace(1)* %132, align 4, !tbaa !10
  %133 = add nuw nsw i32 %100, 8
  %134 = add i32 %101, 8
  %135 = icmp eq i32 %134, %30
  br i1 %135, label %136, label %99, !llvm.loop !12

136:                                              ; preds = %99, %98
  %137 = phi i32 [ 0, %98 ], [ %133, %99 ]
  br i1 %31, label %147, label %138

138:                                              ; preds = %136, %138
  %139 = phi i32 [ %144, %138 ], [ %137, %136 ]
  %140 = phi i32 [ %145, %138 ], [ 0, %136 ]
  %141 = add nsw i32 %139, %47
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %142
  store i32 %51, i32 addrspace(1)* %143, align 4, !tbaa !10
  %144 = add nuw nsw i32 %139, 1
  %145 = add i32 %140, 1
  %146 = icmp eq i32 %145, %28
  br i1 %146, label %147, label %138, !llvm.loop !14

147:                                              ; preds = %136, %138, %95
  %148 = add nsw i32 %50, %47
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %149
  store i32 %51, i32 addrspace(1)* %150, align 4, !tbaa !10
  %151 = add nsw i32 %50, 1
  br label %152

152:                                              ; preds = %147, %49
  %153 = phi i32 [ %151, %147 ], [ %50, %49 ]
  %154 = add nuw nsw i32 %51, 1
  %155 = icmp sge i32 %154, %1
  %156 = icmp eq i32 %153, %4
  %157 = select i1 %155, i1 true, i1 %156
  br i1 %157, label %158, label %49, !llvm.loop !16

158:                                              ; preds = %152, %32
  %159 = add nuw nsw i32 %33, 1
  %160 = icmp eq i32 %159, %2
  br i1 %160, label %48, label %32, !llvm.loop !17
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !7, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = distinct !{!16, !13}
!17 = distinct !{!17, !13}
