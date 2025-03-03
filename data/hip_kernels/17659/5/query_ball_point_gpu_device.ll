; ModuleID = '../data/hip_kernels/17659/5/main.cu'
source_filename = "../data/hip_kernels/17659/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20query_ball_point_gpuiiifiPKfS0_PiS1_(i32 %0, i32 %1, i32 %2, float %3, i32 %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture writeonly %7, i32 addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, 3
  %12 = mul i32 %11, %1
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %5, i64 %13
  %15 = mul i32 %10, %2
  %16 = mul i32 %15, 3
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %6, i64 %17
  %19 = mul i32 %15, %4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %20
  %22 = sext i32 %15 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %25 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %26 = getelementptr i8, i8 addrspace(4)* %25, i64 4
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 4, !range !5, !invariant.load !6
  %29 = zext i16 %28 to i32
  %30 = icmp slt i32 %24, %2
  br i1 %30, label %31, label %57

31:                                               ; preds = %9
  %32 = icmp slt i32 %1, 1
  %33 = icmp eq i32 %4, 0
  %34 = select i1 %32, i1 true, i1 %33
  %35 = icmp slt i32 %4, 1
  %36 = add i32 %4, -1
  %37 = and i32 %4, 7
  %38 = icmp ult i32 %36, 7
  %39 = and i32 %4, -8
  %40 = icmp eq i32 %37, 0
  br label %41

41:                                               ; preds = %31, %167
  %42 = phi i32 [ %24, %31 ], [ %171, %167 ]
  br i1 %34, label %167, label %43

43:                                               ; preds = %41
  %44 = mul nsw i32 %42, 3
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %18, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !6
  %48 = add nuw nsw i32 %44, 1
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %18, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !6
  %52 = add nuw nsw i32 %44, 2
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %18, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !6
  %56 = mul nsw i32 %42, %4
  br label %58

57:                                               ; preds = %167, %9
  ret void

58:                                               ; preds = %43, %161
  %59 = phi i32 [ 0, %43 ], [ %162, %161 ]
  %60 = phi i32 [ 0, %43 ], [ %163, %161 ]
  %61 = mul nuw nsw i32 %60, 3
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %14, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !6
  %65 = add nuw nsw i32 %61, 1
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %14, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7, !amdgpu.noclobber !6
  %69 = add nuw nsw i32 %61, 2
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %14, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7, !amdgpu.noclobber !6
  %73 = fsub contract float %47, %64
  %74 = fmul contract float %73, %73
  %75 = fsub contract float %51, %68
  %76 = fmul contract float %75, %75
  %77 = fadd contract float %74, %76
  %78 = fsub contract float %55, %72
  %79 = fmul contract float %78, %78
  %80 = fadd contract float %77, %79
  %81 = fcmp olt float %80, 0x39F0000000000000
  %82 = select i1 %81, float 0x41F0000000000000, float 1.000000e+00
  %83 = fmul float %80, %82
  %84 = tail call float @llvm.sqrt.f32(float %83)
  %85 = bitcast float %84 to i32
  %86 = add nsw i32 %85, -1
  %87 = bitcast i32 %86 to float
  %88 = add nsw i32 %85, 1
  %89 = bitcast i32 %88 to float
  %90 = tail call i1 @llvm.amdgcn.class.f32(float %83, i32 608)
  %91 = select i1 %81, float 0x3EF0000000000000, float 1.000000e+00
  %92 = fneg float %89
  %93 = tail call float @llvm.fma.f32(float %92, float %84, float %83)
  %94 = fcmp ogt float %93, 0.000000e+00
  %95 = fneg float %87
  %96 = tail call float @llvm.fma.f32(float %95, float %84, float %83)
  %97 = fcmp ole float %96, 0.000000e+00
  %98 = select i1 %97, float %87, float %84
  %99 = select i1 %94, float %89, float %98
  %100 = fmul float %91, %99
  %101 = select i1 %90, float %83, float %100
  %102 = tail call float @llvm.maxnum.f32(float %101, float 0x3BC79CA100000000)
  %103 = fcmp contract olt float %102, %3
  br i1 %103, label %104, label %161

104:                                              ; preds = %58
  %105 = icmp ne i32 %59, 0
  %106 = select i1 %105, i1 true, i1 %35
  br i1 %106, label %156, label %107

107:                                              ; preds = %104
  br i1 %38, label %145, label %108

108:                                              ; preds = %107, %108
  %109 = phi i32 [ %142, %108 ], [ 0, %107 ]
  %110 = phi i32 [ %143, %108 ], [ 0, %107 ]
  %111 = add nsw i32 %109, %56
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %112
  store i32 %60, i32 addrspace(1)* %113, align 4, !tbaa !11
  %114 = or i32 %109, 1
  %115 = add nsw i32 %114, %56
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %116
  store i32 %60, i32 addrspace(1)* %117, align 4, !tbaa !11
  %118 = or i32 %109, 2
  %119 = add nsw i32 %118, %56
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %120
  store i32 %60, i32 addrspace(1)* %121, align 4, !tbaa !11
  %122 = or i32 %109, 3
  %123 = add nsw i32 %122, %56
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %124
  store i32 %60, i32 addrspace(1)* %125, align 4, !tbaa !11
  %126 = or i32 %109, 4
  %127 = add nsw i32 %126, %56
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %128
  store i32 %60, i32 addrspace(1)* %129, align 4, !tbaa !11
  %130 = or i32 %109, 5
  %131 = add nsw i32 %130, %56
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %132
  store i32 %60, i32 addrspace(1)* %133, align 4, !tbaa !11
  %134 = or i32 %109, 6
  %135 = add nsw i32 %134, %56
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %136
  store i32 %60, i32 addrspace(1)* %137, align 4, !tbaa !11
  %138 = or i32 %109, 7
  %139 = add nsw i32 %138, %56
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %140
  store i32 %60, i32 addrspace(1)* %141, align 4, !tbaa !11
  %142 = add nuw nsw i32 %109, 8
  %143 = add i32 %110, 8
  %144 = icmp eq i32 %143, %39
  br i1 %144, label %145, label %108, !llvm.loop !13

145:                                              ; preds = %108, %107
  %146 = phi i32 [ 0, %107 ], [ %142, %108 ]
  br i1 %40, label %156, label %147

147:                                              ; preds = %145, %147
  %148 = phi i32 [ %153, %147 ], [ %146, %145 ]
  %149 = phi i32 [ %154, %147 ], [ 0, %145 ]
  %150 = add nsw i32 %148, %56
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %151
  store i32 %60, i32 addrspace(1)* %152, align 4, !tbaa !11
  %153 = add nuw nsw i32 %148, 1
  %154 = add i32 %149, 1
  %155 = icmp eq i32 %154, %37
  br i1 %155, label %156, label %147, !llvm.loop !15

156:                                              ; preds = %145, %147, %104
  %157 = add nsw i32 %59, %56
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %158
  store i32 %60, i32 addrspace(1)* %159, align 4, !tbaa !11
  %160 = add nsw i32 %59, 1
  br label %161

161:                                              ; preds = %156, %58
  %162 = phi i32 [ %160, %156 ], [ %59, %58 ]
  %163 = add nuw nsw i32 %60, 1
  %164 = icmp sge i32 %163, %1
  %165 = icmp eq i32 %162, %4
  %166 = select i1 %164, i1 true, i1 %165
  br i1 %166, label %167, label %58, !llvm.loop !17

167:                                              ; preds = %161, %41
  %168 = phi i32 [ 0, %41 ], [ %162, %161 ]
  %169 = zext i32 %42 to i64
  %170 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %169
  store i32 %168, i32 addrspace(1)* %170, align 4, !tbaa !11
  %171 = add nuw nsw i32 %42, %29
  %172 = icmp slt i32 %171, %2
  br i1 %172, label %41, label %57, !llvm.loop !18
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
