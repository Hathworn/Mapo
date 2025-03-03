; ModuleID = '../data/hip_kernels/3072/6/main.cu'
source_filename = "../data/hip_kernels/3072/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21query_ball_point2_gpuiiiiPKfS0_S0_PiS1_(i32 %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture writeonly %7, i32 addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, 3
  %12 = mul i32 %11, %1
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %4, i64 %13
  %15 = mul i32 %10, %2
  %16 = mul i32 %15, 3
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %5, i64 %17
  %19 = sext i32 %15 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %6, i64 %19
  %21 = mul i32 %15, %3
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %22
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %19
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %26 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %27 = getelementptr i8, i8 addrspace(4)* %26, i64 4
  %28 = bitcast i8 addrspace(4)* %27 to i16 addrspace(4)*
  %29 = load i16, i16 addrspace(4)* %28, align 4, !range !5, !invariant.load !6
  %30 = zext i16 %29 to i32
  %31 = icmp slt i32 %25, %2
  br i1 %31, label %32, label %63

32:                                               ; preds = %9
  %33 = icmp slt i32 %1, 1
  %34 = icmp eq i32 %3, 0
  %35 = select i1 %33, i1 true, i1 %34
  %36 = icmp slt i32 %3, 1
  %37 = add i32 %3, -1
  %38 = and i32 %3, 7
  %39 = icmp ult i32 %37, 7
  %40 = and i32 %3, -8
  %41 = icmp eq i32 %38, 0
  br label %42

42:                                               ; preds = %32, %173
  %43 = phi i32 [ %25, %32 ], [ %177, %173 ]
  br i1 %35, label %44, label %46

44:                                               ; preds = %42
  %45 = zext i32 %43 to i64
  br label %173

46:                                               ; preds = %42
  %47 = mul nsw i32 %43, 3
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %18, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !6
  %51 = add nuw nsw i32 %47, 1
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %18, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !6
  %55 = add nuw nsw i32 %47, 2
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %18, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !6
  %59 = zext i32 %43 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %20, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !6
  %62 = mul nsw i32 %43, %3
  br label %64

63:                                               ; preds = %173, %9
  ret void

64:                                               ; preds = %46, %167
  %65 = phi i32 [ 0, %46 ], [ %169, %167 ]
  %66 = phi i32 [ 0, %46 ], [ %168, %167 ]
  %67 = mul nuw nsw i32 %65, 3
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %14, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !6
  %71 = add nuw nsw i32 %67, 1
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %14, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !6
  %75 = add nuw nsw i32 %67, 2
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %14, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !6
  %79 = fsub contract float %50, %70
  %80 = fmul contract float %79, %79
  %81 = fsub contract float %54, %74
  %82 = fmul contract float %81, %81
  %83 = fadd contract float %80, %82
  %84 = fsub contract float %58, %78
  %85 = fmul contract float %84, %84
  %86 = fadd contract float %83, %85
  %87 = fcmp olt float %86, 0x39F0000000000000
  %88 = select i1 %87, float 0x41F0000000000000, float 1.000000e+00
  %89 = fmul float %86, %88
  %90 = tail call float @llvm.sqrt.f32(float %89)
  %91 = bitcast float %90 to i32
  %92 = add nsw i32 %91, -1
  %93 = bitcast i32 %92 to float
  %94 = add nsw i32 %91, 1
  %95 = bitcast i32 %94 to float
  %96 = tail call i1 @llvm.amdgcn.class.f32(float %89, i32 608)
  %97 = select i1 %87, float 0x3EF0000000000000, float 1.000000e+00
  %98 = fneg float %95
  %99 = tail call float @llvm.fma.f32(float %98, float %90, float %89)
  %100 = fcmp ogt float %99, 0.000000e+00
  %101 = fneg float %93
  %102 = tail call float @llvm.fma.f32(float %101, float %90, float %89)
  %103 = fcmp ole float %102, 0.000000e+00
  %104 = select i1 %103, float %93, float %90
  %105 = select i1 %100, float %95, float %104
  %106 = fmul float %97, %105
  %107 = select i1 %96, float %89, float %106
  %108 = tail call float @llvm.maxnum.f32(float %107, float 0x3BC79CA100000000)
  %109 = fcmp contract olt float %108, %61
  br i1 %109, label %110, label %167

110:                                              ; preds = %64
  %111 = icmp ne i32 %66, 0
  %112 = select i1 %111, i1 true, i1 %36
  br i1 %112, label %162, label %113

113:                                              ; preds = %110
  br i1 %39, label %151, label %114

114:                                              ; preds = %113, %114
  %115 = phi i32 [ %148, %114 ], [ 0, %113 ]
  %116 = phi i32 [ %149, %114 ], [ 0, %113 ]
  %117 = add nsw i32 %115, %62
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %118
  store i32 %65, i32 addrspace(1)* %119, align 4, !tbaa !11
  %120 = or i32 %115, 1
  %121 = add nsw i32 %120, %62
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %122
  store i32 %65, i32 addrspace(1)* %123, align 4, !tbaa !11
  %124 = or i32 %115, 2
  %125 = add nsw i32 %124, %62
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %126
  store i32 %65, i32 addrspace(1)* %127, align 4, !tbaa !11
  %128 = or i32 %115, 3
  %129 = add nsw i32 %128, %62
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %130
  store i32 %65, i32 addrspace(1)* %131, align 4, !tbaa !11
  %132 = or i32 %115, 4
  %133 = add nsw i32 %132, %62
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %134
  store i32 %65, i32 addrspace(1)* %135, align 4, !tbaa !11
  %136 = or i32 %115, 5
  %137 = add nsw i32 %136, %62
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %138
  store i32 %65, i32 addrspace(1)* %139, align 4, !tbaa !11
  %140 = or i32 %115, 6
  %141 = add nsw i32 %140, %62
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %142
  store i32 %65, i32 addrspace(1)* %143, align 4, !tbaa !11
  %144 = or i32 %115, 7
  %145 = add nsw i32 %144, %62
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %146
  store i32 %65, i32 addrspace(1)* %147, align 4, !tbaa !11
  %148 = add nuw nsw i32 %115, 8
  %149 = add i32 %116, 8
  %150 = icmp eq i32 %149, %40
  br i1 %150, label %151, label %114, !llvm.loop !13

151:                                              ; preds = %114, %113
  %152 = phi i32 [ 0, %113 ], [ %148, %114 ]
  br i1 %41, label %162, label %153

153:                                              ; preds = %151, %153
  %154 = phi i32 [ %159, %153 ], [ %152, %151 ]
  %155 = phi i32 [ %160, %153 ], [ 0, %151 ]
  %156 = add nsw i32 %154, %62
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %157
  store i32 %65, i32 addrspace(1)* %158, align 4, !tbaa !11
  %159 = add nuw nsw i32 %154, 1
  %160 = add i32 %155, 1
  %161 = icmp eq i32 %160, %38
  br i1 %161, label %162, label %153, !llvm.loop !15

162:                                              ; preds = %151, %153, %110
  %163 = add nsw i32 %66, %62
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %164
  store i32 %65, i32 addrspace(1)* %165, align 4, !tbaa !11
  %166 = add nsw i32 %66, 1
  br label %167

167:                                              ; preds = %162, %64
  %168 = phi i32 [ %166, %162 ], [ %66, %64 ]
  %169 = add nuw nsw i32 %65, 1
  %170 = icmp sge i32 %169, %1
  %171 = icmp eq i32 %168, %3
  %172 = select i1 %170, i1 true, i1 %171
  br i1 %172, label %173, label %64, !llvm.loop !17

173:                                              ; preds = %167, %44
  %174 = phi i64 [ %45, %44 ], [ %59, %167 ]
  %175 = phi i32 [ 0, %44 ], [ %168, %167 ]
  %176 = getelementptr inbounds i32, i32 addrspace(1)* %24, i64 %174
  store i32 %175, i32 addrspace(1)* %176, align 4, !tbaa !11
  %177 = add nuw nsw i32 %43, %30
  %178 = icmp slt i32 %177, %2
  br i1 %178, label %42, label %63, !llvm.loop !18
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
