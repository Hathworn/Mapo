; ModuleID = '../data/hip_kernels/13800/50/main.cu'
source_filename = "../data/hip_kernels/13800/50/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9mysgemmNTPKfiS0_iPfiiff(float addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, float addrspace(1)* nocapture %4, i32 %5, i32 %6, float %7, float %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %26 = add i32 %24, %25
  %27 = icmp sgt i32 %6, 0
  br i1 %27, label %28, label %57

28:                                               ; preds = %9
  %29 = and i32 %6, 7
  %30 = icmp ult i32 %6, 8
  br i1 %30, label %33, label %31

31:                                               ; preds = %28
  %32 = and i32 %6, -8
  br label %67

33:                                               ; preds = %67, %28
  %34 = phi float [ undef, %28 ], [ %173, %67 ]
  %35 = phi float [ 0.000000e+00, %28 ], [ %173, %67 ]
  %36 = phi i32 [ 0, %28 ], [ %174, %67 ]
  %37 = icmp eq i32 %29, 0
  br i1 %37, label %57, label %38

38:                                               ; preds = %33, %38
  %39 = phi float [ %53, %38 ], [ %35, %33 ]
  %40 = phi i32 [ %54, %38 ], [ %36, %33 ]
  %41 = phi i32 [ %55, %38 ], [ 0, %33 ]
  %42 = mul nsw i32 %40, %1
  %43 = add nsw i32 %42, %18
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = mul nsw i32 %40, %3
  %48 = add nsw i32 %47, %26
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %2, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !5
  %52 = fmul contract float %46, %51
  %53 = fadd contract float %39, %52
  %54 = add nuw nsw i32 %40, 1
  %55 = add i32 %41, 1
  %56 = icmp eq i32 %55, %29
  br i1 %56, label %57, label %38, !llvm.loop !11

57:                                               ; preds = %33, %38, %9
  %58 = phi float [ 0.000000e+00, %9 ], [ %34, %33 ], [ %53, %38 ]
  %59 = mul nsw i32 %26, %5
  %60 = add nsw i32 %59, %18
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %4, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !5
  %64 = fmul contract float %63, %8
  %65 = fmul contract float %58, %7
  %66 = fadd contract float %65, %64
  store float %66, float addrspace(1)* %62, align 4, !tbaa !7
  ret void

67:                                               ; preds = %67, %31
  %68 = phi float [ 0.000000e+00, %31 ], [ %173, %67 ]
  %69 = phi i32 [ 0, %31 ], [ %174, %67 ]
  %70 = phi i32 [ 0, %31 ], [ %175, %67 ]
  %71 = mul nsw i32 %69, %1
  %72 = add nsw i32 %71, %18
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !5
  %76 = mul nsw i32 %69, %3
  %77 = add nsw i32 %76, %26
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %2, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7, !amdgpu.noclobber !5
  %81 = fmul contract float %75, %80
  %82 = fadd contract float %68, %81
  %83 = or i32 %69, 1
  %84 = mul nsw i32 %83, %1
  %85 = add nsw i32 %84, %18
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = mul nsw i32 %83, %3
  %90 = add nsw i32 %89, %26
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %2, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !5
  %94 = fmul contract float %88, %93
  %95 = fadd contract float %82, %94
  %96 = or i32 %69, 2
  %97 = mul nsw i32 %96, %1
  %98 = add nsw i32 %97, %18
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %0, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !5
  %102 = mul nsw i32 %96, %3
  %103 = add nsw i32 %102, %26
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %2, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !5
  %107 = fmul contract float %101, %106
  %108 = fadd contract float %95, %107
  %109 = or i32 %69, 3
  %110 = mul nsw i32 %109, %1
  %111 = add nsw i32 %110, %18
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7, !amdgpu.noclobber !5
  %115 = mul nsw i32 %109, %3
  %116 = add nsw i32 %115, %26
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %2, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7, !amdgpu.noclobber !5
  %120 = fmul contract float %114, %119
  %121 = fadd contract float %108, %120
  %122 = or i32 %69, 4
  %123 = mul nsw i32 %122, %1
  %124 = add nsw i32 %123, %18
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %0, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7, !amdgpu.noclobber !5
  %128 = mul nsw i32 %122, %3
  %129 = add nsw i32 %128, %26
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %2, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7, !amdgpu.noclobber !5
  %133 = fmul contract float %127, %132
  %134 = fadd contract float %121, %133
  %135 = or i32 %69, 5
  %136 = mul nsw i32 %135, %1
  %137 = add nsw i32 %136, %18
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %0, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !7, !amdgpu.noclobber !5
  %141 = mul nsw i32 %135, %3
  %142 = add nsw i32 %141, %26
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %2, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !7, !amdgpu.noclobber !5
  %146 = fmul contract float %140, %145
  %147 = fadd contract float %134, %146
  %148 = or i32 %69, 6
  %149 = mul nsw i32 %148, %1
  %150 = add nsw i32 %149, %18
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %0, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !7, !amdgpu.noclobber !5
  %154 = mul nsw i32 %148, %3
  %155 = add nsw i32 %154, %26
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %2, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !7, !amdgpu.noclobber !5
  %159 = fmul contract float %153, %158
  %160 = fadd contract float %147, %159
  %161 = or i32 %69, 7
  %162 = mul nsw i32 %161, %1
  %163 = add nsw i32 %162, %18
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %0, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !7, !amdgpu.noclobber !5
  %167 = mul nsw i32 %161, %3
  %168 = add nsw i32 %167, %26
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %2, i64 %169
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !7, !amdgpu.noclobber !5
  %172 = fmul contract float %166, %171
  %173 = fadd contract float %160, %172
  %174 = add nuw nsw i32 %69, 8
  %175 = add i32 %70, 8
  %176 = icmp eq i32 %175, %32
  br i1 %176, label %33, label %67, !llvm.loop !13
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
