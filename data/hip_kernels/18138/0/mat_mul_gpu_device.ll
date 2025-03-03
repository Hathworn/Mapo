; ModuleID = '../data/hip_kernels/18138/0/main.cu'
source_filename = "../data/hip_kernels/18138/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11mat_mul_gpuPfS_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 2, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = add i32 %21, %22
  %24 = mul nsw i32 %15, %5
  %25 = add nsw i32 %24, %23
  %26 = icmp slt i32 %15, %3
  %27 = icmp slt i32 %23, %5
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %166

29:                                               ; preds = %6
  %30 = icmp sgt i32 %4, 0
  br i1 %30, label %31, label %60

31:                                               ; preds = %29
  %32 = mul nsw i32 %15, %4
  %33 = and i32 %4, 7
  %34 = icmp ult i32 %4, 8
  br i1 %34, label %37, label %35

35:                                               ; preds = %31
  %36 = and i32 %4, -8
  br label %64

37:                                               ; preds = %64, %31
  %38 = phi float [ undef, %31 ], [ %162, %64 ]
  %39 = phi i32 [ 0, %31 ], [ %163, %64 ]
  %40 = phi float [ 0.000000e+00, %31 ], [ %162, %64 ]
  %41 = icmp eq i32 %33, 0
  br i1 %41, label %60, label %42

42:                                               ; preds = %37, %42
  %43 = phi i32 [ %57, %42 ], [ %39, %37 ]
  %44 = phi float [ %56, %42 ], [ %40, %37 ]
  %45 = phi i32 [ %58, %42 ], [ 0, %37 ]
  %46 = add nsw i32 %43, %32
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !5
  %50 = mul nsw i32 %43, %5
  %51 = add nsw i32 %50, %23
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !5
  %55 = fmul contract float %49, %54
  %56 = fadd contract float %44, %55
  %57 = add nuw nsw i32 %43, 1
  %58 = add i32 %45, 1
  %59 = icmp eq i32 %58, %33
  br i1 %59, label %60, label %42, !llvm.loop !11

60:                                               ; preds = %37, %42, %29
  %61 = phi float [ 0.000000e+00, %29 ], [ %38, %37 ], [ %56, %42 ]
  %62 = sext i32 %25 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %2, i64 %62
  store float %61, float addrspace(1)* %63, align 4, !tbaa !7
  br label %166

64:                                               ; preds = %64, %35
  %65 = phi i32 [ 0, %35 ], [ %163, %64 ]
  %66 = phi float [ 0.000000e+00, %35 ], [ %162, %64 ]
  %67 = phi i32 [ 0, %35 ], [ %164, %64 ]
  %68 = add nsw i32 %65, %32
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !5
  %72 = mul nsw i32 %65, %5
  %73 = add nsw i32 %72, %23
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !5
  %77 = fmul contract float %71, %76
  %78 = fadd contract float %66, %77
  %79 = or i32 %65, 1
  %80 = add nsw i32 %79, %32
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7, !amdgpu.noclobber !5
  %84 = mul nsw i32 %79, %5
  %85 = add nsw i32 %84, %23
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = fmul contract float %83, %88
  %90 = fadd contract float %78, %89
  %91 = or i32 %65, 2
  %92 = add nsw i32 %91, %32
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !5
  %96 = mul nsw i32 %91, %5
  %97 = add nsw i32 %96, %23
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %1, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !5
  %101 = fmul contract float %95, %100
  %102 = fadd contract float %90, %101
  %103 = or i32 %65, 3
  %104 = add nsw i32 %103, %32
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !5
  %108 = mul nsw i32 %103, %5
  %109 = add nsw i32 %108, %23
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %1, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7, !amdgpu.noclobber !5
  %113 = fmul contract float %107, %112
  %114 = fadd contract float %102, %113
  %115 = or i32 %65, 4
  %116 = add nsw i32 %115, %32
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %0, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7, !amdgpu.noclobber !5
  %120 = mul nsw i32 %115, %5
  %121 = add nsw i32 %120, %23
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %1, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !7, !amdgpu.noclobber !5
  %125 = fmul contract float %119, %124
  %126 = fadd contract float %114, %125
  %127 = or i32 %65, 5
  %128 = add nsw i32 %127, %32
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %0, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7, !amdgpu.noclobber !5
  %132 = mul nsw i32 %127, %5
  %133 = add nsw i32 %132, %23
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %1, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7, !amdgpu.noclobber !5
  %137 = fmul contract float %131, %136
  %138 = fadd contract float %126, %137
  %139 = or i32 %65, 6
  %140 = add nsw i32 %139, %32
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %0, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !7, !amdgpu.noclobber !5
  %144 = mul nsw i32 %139, %5
  %145 = add nsw i32 %144, %23
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %1, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !7, !amdgpu.noclobber !5
  %149 = fmul contract float %143, %148
  %150 = fadd contract float %138, %149
  %151 = or i32 %65, 7
  %152 = add nsw i32 %151, %32
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %0, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !7, !amdgpu.noclobber !5
  %156 = mul nsw i32 %151, %5
  %157 = add nsw i32 %156, %23
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %1, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !7, !amdgpu.noclobber !5
  %161 = fmul contract float %155, %160
  %162 = fadd contract float %150, %161
  %163 = add nuw nsw i32 %65, 8
  %164 = add i32 %67, 8
  %165 = icmp eq i32 %164, %36
  br i1 %165, label %37, label %64, !llvm.loop !13

166:                                              ; preds = %60, %6
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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
