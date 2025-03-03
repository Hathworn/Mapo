; ModuleID = '../data/hip_kernels/1383/12/main.cu'
source_filename = "../data/hip_kernels/1383/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20query_ball_point_gpuiiifiPKfS0_Pi(i32 %0, i32 %1, i32 %2, float %3, i32 %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, 3
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
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %22 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %23 = getelementptr i8, i8 addrspace(4)* %22, i64 4
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 4, !range !5, !invariant.load !6
  %26 = zext i16 %25 to i32
  %27 = icmp slt i32 %21, %2
  br i1 %27, label %28, label %54

28:                                               ; preds = %8
  %29 = icmp slt i32 %1, 1
  %30 = icmp eq i32 %4, 0
  %31 = select i1 %29, i1 true, i1 %30
  %32 = icmp slt i32 %4, 1
  %33 = add i32 %4, -1
  %34 = and i32 %4, 7
  %35 = icmp ult i32 %33, 7
  %36 = and i32 %4, -8
  %37 = icmp eq i32 %34, 0
  br label %38

38:                                               ; preds = %28, %164
  %39 = phi i32 [ %21, %28 ], [ %165, %164 ]
  br i1 %31, label %164, label %40

40:                                               ; preds = %38
  %41 = mul nsw i32 %39, 3
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %16, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !6
  %45 = add nuw nsw i32 %41, 1
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %16, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !6
  %49 = add nuw nsw i32 %41, 2
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %16, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !6
  %53 = mul nsw i32 %39, %4
  br label %55

54:                                               ; preds = %164, %8
  ret void

55:                                               ; preds = %40, %158
  %56 = phi i32 [ 0, %40 ], [ %159, %158 ]
  %57 = phi i32 [ 0, %40 ], [ %160, %158 ]
  %58 = mul nuw nsw i32 %57, 3
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %13, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !6
  %62 = add nuw nsw i32 %58, 1
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %13, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !6
  %66 = add nuw nsw i32 %58, 2
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %13, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !6
  %70 = fsub contract float %44, %61
  %71 = fmul contract float %70, %70
  %72 = fsub contract float %48, %65
  %73 = fmul contract float %72, %72
  %74 = fadd contract float %71, %73
  %75 = fsub contract float %52, %69
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
  %103 = select i1 %102, i1 true, i1 %32
  br i1 %103, label %153, label %104

104:                                              ; preds = %101
  br i1 %35, label %142, label %105

105:                                              ; preds = %104, %105
  %106 = phi i32 [ %139, %105 ], [ 0, %104 ]
  %107 = phi i32 [ %140, %105 ], [ 0, %104 ]
  %108 = add nsw i32 %106, %53
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %109
  store i32 %57, i32 addrspace(1)* %110, align 4, !tbaa !11
  %111 = or i32 %106, 1
  %112 = add nsw i32 %111, %53
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %113
  store i32 %57, i32 addrspace(1)* %114, align 4, !tbaa !11
  %115 = or i32 %106, 2
  %116 = add nsw i32 %115, %53
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %117
  store i32 %57, i32 addrspace(1)* %118, align 4, !tbaa !11
  %119 = or i32 %106, 3
  %120 = add nsw i32 %119, %53
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %121
  store i32 %57, i32 addrspace(1)* %122, align 4, !tbaa !11
  %123 = or i32 %106, 4
  %124 = add nsw i32 %123, %53
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %125
  store i32 %57, i32 addrspace(1)* %126, align 4, !tbaa !11
  %127 = or i32 %106, 5
  %128 = add nsw i32 %127, %53
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %129
  store i32 %57, i32 addrspace(1)* %130, align 4, !tbaa !11
  %131 = or i32 %106, 6
  %132 = add nsw i32 %131, %53
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %133
  store i32 %57, i32 addrspace(1)* %134, align 4, !tbaa !11
  %135 = or i32 %106, 7
  %136 = add nsw i32 %135, %53
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %137
  store i32 %57, i32 addrspace(1)* %138, align 4, !tbaa !11
  %139 = add nuw nsw i32 %106, 8
  %140 = add i32 %107, 8
  %141 = icmp eq i32 %140, %36
  br i1 %141, label %142, label %105, !llvm.loop !13

142:                                              ; preds = %105, %104
  %143 = phi i32 [ 0, %104 ], [ %139, %105 ]
  br i1 %37, label %153, label %144

144:                                              ; preds = %142, %144
  %145 = phi i32 [ %150, %144 ], [ %143, %142 ]
  %146 = phi i32 [ %151, %144 ], [ 0, %142 ]
  %147 = add nsw i32 %145, %53
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %148
  store i32 %57, i32 addrspace(1)* %149, align 4, !tbaa !11
  %150 = add nuw nsw i32 %145, 1
  %151 = add i32 %146, 1
  %152 = icmp eq i32 %151, %34
  br i1 %152, label %153, label %144, !llvm.loop !15

153:                                              ; preds = %142, %144, %101
  %154 = add nsw i32 %56, %53
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %155
  store i32 %57, i32 addrspace(1)* %156, align 4, !tbaa !11
  %157 = add nsw i32 %56, 1
  br label %158

158:                                              ; preds = %153, %55
  %159 = phi i32 [ %157, %153 ], [ %56, %55 ]
  %160 = add nuw nsw i32 %57, 1
  %161 = icmp sge i32 %160, %1
  %162 = icmp eq i32 %159, %4
  %163 = select i1 %161, i1 true, i1 %162
  br i1 %163, label %164, label %55, !llvm.loop !17

164:                                              ; preds = %158, %38
  %165 = add nuw nsw i32 %39, %26
  %166 = icmp slt i32 %165, %2
  br i1 %166, label %38, label %54, !llvm.loop !18
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !14}
