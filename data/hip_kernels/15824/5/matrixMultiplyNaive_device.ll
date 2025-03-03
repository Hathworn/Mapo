; ModuleID = '../data/hip_kernels/15824/5/main.cu'
source_filename = "../data/hip_kernels/15824/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19matrixMultiplyNaivePfS_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 2, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %8, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = add i32 %21, %22
  %24 = icmp slt i32 %15, %3
  %25 = icmp slt i32 %23, %5
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %166

27:                                               ; preds = %6
  %28 = icmp sgt i32 %4, 0
  br i1 %28, label %29, label %160

29:                                               ; preds = %27
  %30 = mul nsw i32 %15, %4
  %31 = and i32 %4, 7
  %32 = icmp ult i32 %4, 8
  br i1 %32, label %137, label %33

33:                                               ; preds = %29
  %34 = and i32 %4, -8
  br label %35

35:                                               ; preds = %35, %33
  %36 = phi i32 [ 0, %33 ], [ %134, %35 ]
  %37 = phi float [ 0.000000e+00, %33 ], [ %133, %35 ]
  %38 = phi i32 [ 0, %33 ], [ %135, %35 ]
  %39 = add nsw i32 %36, %30
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %0, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = mul nsw i32 %36, %5
  %44 = add nsw i32 %43, %23
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = fmul contract float %42, %47
  %49 = fadd contract float %37, %48
  %50 = or i32 %36, 1
  %51 = add nsw i32 %50, %30
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !5
  %55 = mul nsw i32 %50, %5
  %56 = add nsw i32 %55, %23
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !5
  %60 = fmul contract float %54, %59
  %61 = fadd contract float %49, %60
  %62 = or i32 %36, 2
  %63 = add nsw i32 %62, %30
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !5
  %67 = mul nsw i32 %62, %5
  %68 = add nsw i32 %67, %23
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %1, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !5
  %72 = fmul contract float %66, %71
  %73 = fadd contract float %61, %72
  %74 = or i32 %36, 3
  %75 = add nsw i32 %74, %30
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !5
  %79 = mul nsw i32 %74, %5
  %80 = add nsw i32 %79, %23
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7, !amdgpu.noclobber !5
  %84 = fmul contract float %78, %83
  %85 = fadd contract float %73, %84
  %86 = or i32 %36, 4
  %87 = add nsw i32 %86, %30
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7, !amdgpu.noclobber !5
  %91 = mul nsw i32 %86, %5
  %92 = add nsw i32 %91, %23
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %1, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !5
  %96 = fmul contract float %90, %95
  %97 = fadd contract float %85, %96
  %98 = or i32 %36, 5
  %99 = add nsw i32 %98, %30
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7, !amdgpu.noclobber !5
  %103 = mul nsw i32 %98, %5
  %104 = add nsw i32 %103, %23
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %1, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !5
  %108 = fmul contract float %102, %107
  %109 = fadd contract float %97, %108
  %110 = or i32 %36, 6
  %111 = add nsw i32 %110, %30
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7, !amdgpu.noclobber !5
  %115 = mul nsw i32 %110, %5
  %116 = add nsw i32 %115, %23
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %1, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7, !amdgpu.noclobber !5
  %120 = fmul contract float %114, %119
  %121 = fadd contract float %109, %120
  %122 = or i32 %36, 7
  %123 = add nsw i32 %122, %30
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %0, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !5
  %127 = mul nsw i32 %122, %5
  %128 = add nsw i32 %127, %23
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %1, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7, !amdgpu.noclobber !5
  %132 = fmul contract float %126, %131
  %133 = fadd contract float %121, %132
  %134 = add nuw nsw i32 %36, 8
  %135 = add i32 %38, 8
  %136 = icmp eq i32 %135, %34
  br i1 %136, label %137, label %35, !llvm.loop !11

137:                                              ; preds = %35, %29
  %138 = phi float [ undef, %29 ], [ %133, %35 ]
  %139 = phi i32 [ 0, %29 ], [ %134, %35 ]
  %140 = phi float [ 0.000000e+00, %29 ], [ %133, %35 ]
  %141 = icmp eq i32 %31, 0
  br i1 %141, label %160, label %142

142:                                              ; preds = %137, %142
  %143 = phi i32 [ %157, %142 ], [ %139, %137 ]
  %144 = phi float [ %156, %142 ], [ %140, %137 ]
  %145 = phi i32 [ %158, %142 ], [ 0, %137 ]
  %146 = add nsw i32 %143, %30
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %0, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !7, !amdgpu.noclobber !5
  %150 = mul nsw i32 %143, %5
  %151 = add nsw i32 %150, %23
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %1, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !7, !amdgpu.noclobber !5
  %155 = fmul contract float %149, %154
  %156 = fadd contract float %144, %155
  %157 = add nuw nsw i32 %143, 1
  %158 = add i32 %145, 1
  %159 = icmp eq i32 %158, %31
  br i1 %159, label %160, label %142, !llvm.loop !13

160:                                              ; preds = %137, %142, %27
  %161 = phi float [ 0.000000e+00, %27 ], [ %138, %137 ], [ %156, %142 ]
  %162 = mul nsw i32 %15, %5
  %163 = add nsw i32 %162, %23
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %2, i64 %164
  store float %161, float addrspace(1)* %165, align 4, !tbaa !7
  br label %166

166:                                              ; preds = %160, %6
  ret void
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
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
