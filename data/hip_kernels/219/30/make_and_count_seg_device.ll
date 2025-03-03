; ModuleID = '../data/hip_kernels/219/30/main.cu'
source_filename = "../data/hip_kernels/219/30/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18make_and_count_segPfPiS0_iiiiiifff(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, float %9, float %10, float %11) local_unnamed_addr #0 {
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = mul i32 %18, %17
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %19, %20
  %22 = mul nsw i32 %21, %6
  %23 = icmp sgt i32 %22, %5
  %24 = sub nsw i32 %21, %7
  %25 = add nsw i32 %24, 1
  %26 = mul nsw i32 %25, %8
  %27 = add nsw i32 %26, %5
  %28 = icmp slt i32 %27, %3
  %29 = and i1 %23, %28
  %30 = mul nsw i32 %24, %8
  %31 = add nsw i32 %30, %5
  %32 = select i1 %29, i32 %8, i32 %6
  %33 = select i1 %29, i32 %31, i32 %22
  %34 = mul nsw i32 %21, %4
  %35 = sext i32 %33 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %35
  %38 = sext i32 %34 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %38
  %40 = icmp sgt i32 %32, 0
  br i1 %40, label %41, label %180

41:                                               ; preds = %12
  %42 = add nsw i32 %4, -1
  %43 = and i32 %32, 3
  %44 = icmp ult i32 %32, 4
  br i1 %44, label %148, label %45

45:                                               ; preds = %41
  %46 = and i32 %32, -4
  br label %47

47:                                               ; preds = %138, %45
  %48 = phi i32 [ 0, %45 ], [ %145, %138 ]
  %49 = phi i32 [ 0, %45 ], [ %146, %138 ]
  %50 = zext i32 %48 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %36, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7
  %53 = tail call float @llvm.fabs.f32(float %52)
  %54 = fcmp contract ogt float %53, %9
  %55 = fcmp contract olt float %53, %10
  %56 = and i1 %54, %55
  br i1 %56, label %57, label %63

57:                                               ; preds = %47
  %58 = fsub contract float %10, %53
  %59 = tail call float @llvm.fabs.f32(float %58)
  %60 = fmul contract float %59, %11
  %61 = tail call float @llvm.ceil.f32(float %60)
  %62 = fptosi float %61 to i32
  br label %66

63:                                               ; preds = %47
  %64 = fcmp contract ult float %53, %10
  %65 = select i1 %64, i32 %42, i32 0
  br label %66

66:                                               ; preds = %63, %57
  %67 = phi i32 [ %62, %57 ], [ %65, %63 ]
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %50
  store i32 %67, i32 addrspace(1)* %68, align 4, !tbaa !11
  %69 = sext i32 %67 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %39, i64 %69
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !11
  %72 = add nsw i32 %71, 1
  store i32 %72, i32 addrspace(1)* %70, align 4, !tbaa !11
  %73 = or i32 %48, 1
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %36, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7
  %77 = tail call float @llvm.fabs.f32(float %76)
  %78 = fcmp contract ogt float %77, %9
  %79 = fcmp contract olt float %77, %10
  %80 = and i1 %78, %79
  br i1 %80, label %84, label %81

81:                                               ; preds = %66
  %82 = fcmp contract ult float %77, %10
  %83 = select i1 %82, i32 %42, i32 0
  br label %90

84:                                               ; preds = %66
  %85 = fsub contract float %10, %77
  %86 = tail call float @llvm.fabs.f32(float %85)
  %87 = fmul contract float %86, %11
  %88 = tail call float @llvm.ceil.f32(float %87)
  %89 = fptosi float %88 to i32
  br label %90

90:                                               ; preds = %84, %81
  %91 = phi i32 [ %89, %84 ], [ %83, %81 ]
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %74
  store i32 %91, i32 addrspace(1)* %92, align 4, !tbaa !11
  %93 = sext i32 %91 to i64
  %94 = getelementptr inbounds i32, i32 addrspace(1)* %39, i64 %93
  %95 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !11
  %96 = add nsw i32 %95, 1
  store i32 %96, i32 addrspace(1)* %94, align 4, !tbaa !11
  %97 = or i32 %48, 2
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %36, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7
  %101 = tail call float @llvm.fabs.f32(float %100)
  %102 = fcmp contract ogt float %101, %9
  %103 = fcmp contract olt float %101, %10
  %104 = and i1 %102, %103
  br i1 %104, label %108, label %105

105:                                              ; preds = %90
  %106 = fcmp contract ult float %101, %10
  %107 = select i1 %106, i32 %42, i32 0
  br label %114

108:                                              ; preds = %90
  %109 = fsub contract float %10, %101
  %110 = tail call float @llvm.fabs.f32(float %109)
  %111 = fmul contract float %110, %11
  %112 = tail call float @llvm.ceil.f32(float %111)
  %113 = fptosi float %112 to i32
  br label %114

114:                                              ; preds = %108, %105
  %115 = phi i32 [ %113, %108 ], [ %107, %105 ]
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %98
  store i32 %115, i32 addrspace(1)* %116, align 4, !tbaa !11
  %117 = sext i32 %115 to i64
  %118 = getelementptr inbounds i32, i32 addrspace(1)* %39, i64 %117
  %119 = load i32, i32 addrspace(1)* %118, align 4, !tbaa !11
  %120 = add nsw i32 %119, 1
  store i32 %120, i32 addrspace(1)* %118, align 4, !tbaa !11
  %121 = or i32 %48, 3
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %36, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !7
  %125 = tail call float @llvm.fabs.f32(float %124)
  %126 = fcmp contract ogt float %125, %9
  %127 = fcmp contract olt float %125, %10
  %128 = and i1 %126, %127
  br i1 %128, label %132, label %129

129:                                              ; preds = %114
  %130 = fcmp contract ult float %125, %10
  %131 = select i1 %130, i32 %42, i32 0
  br label %138

132:                                              ; preds = %114
  %133 = fsub contract float %10, %125
  %134 = tail call float @llvm.fabs.f32(float %133)
  %135 = fmul contract float %134, %11
  %136 = tail call float @llvm.ceil.f32(float %135)
  %137 = fptosi float %136 to i32
  br label %138

138:                                              ; preds = %132, %129
  %139 = phi i32 [ %137, %132 ], [ %131, %129 ]
  %140 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %122
  store i32 %139, i32 addrspace(1)* %140, align 4, !tbaa !11
  %141 = sext i32 %139 to i64
  %142 = getelementptr inbounds i32, i32 addrspace(1)* %39, i64 %141
  %143 = load i32, i32 addrspace(1)* %142, align 4, !tbaa !11
  %144 = add nsw i32 %143, 1
  store i32 %144, i32 addrspace(1)* %142, align 4, !tbaa !11
  %145 = add nuw nsw i32 %48, 4
  %146 = add i32 %49, 4
  %147 = icmp eq i32 %146, %46
  br i1 %147, label %148, label %47, !llvm.loop !13

148:                                              ; preds = %138, %41
  %149 = phi i32 [ 0, %41 ], [ %145, %138 ]
  %150 = icmp eq i32 %43, 0
  br i1 %150, label %180, label %151

151:                                              ; preds = %148, %170
  %152 = phi i32 [ %177, %170 ], [ %149, %148 ]
  %153 = phi i32 [ %178, %170 ], [ 0, %148 ]
  %154 = zext i32 %152 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %36, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !7
  %157 = tail call float @llvm.fabs.f32(float %156)
  %158 = fcmp contract ogt float %157, %9
  %159 = fcmp contract olt float %157, %10
  %160 = and i1 %158, %159
  br i1 %160, label %164, label %161

161:                                              ; preds = %151
  %162 = fcmp contract ult float %157, %10
  %163 = select i1 %162, i32 %42, i32 0
  br label %170

164:                                              ; preds = %151
  %165 = fsub contract float %10, %157
  %166 = tail call float @llvm.fabs.f32(float %165)
  %167 = fmul contract float %166, %11
  %168 = tail call float @llvm.ceil.f32(float %167)
  %169 = fptosi float %168 to i32
  br label %170

170:                                              ; preds = %164, %161
  %171 = phi i32 [ %169, %164 ], [ %163, %161 ]
  %172 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %154
  store i32 %171, i32 addrspace(1)* %172, align 4, !tbaa !11
  %173 = sext i32 %171 to i64
  %174 = getelementptr inbounds i32, i32 addrspace(1)* %39, i64 %173
  %175 = load i32, i32 addrspace(1)* %174, align 4, !tbaa !11
  %176 = add nsw i32 %175, 1
  store i32 %176, i32 addrspace(1)* %174, align 4, !tbaa !11
  %177 = add nuw nsw i32 %152, 1
  %178 = add i32 %153, 1
  %179 = icmp eq i32 %178, %43
  br i1 %179, label %180, label %151, !llvm.loop !15

180:                                              ; preds = %148, %170, %12
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
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
