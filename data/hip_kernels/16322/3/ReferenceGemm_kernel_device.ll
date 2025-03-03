; ModuleID = '../data/hip_kernels/16322/3/main.cu'
source_filename = "../data/hip_kernels/16322/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20ReferenceGemm_kerneliiifPKfiS0_ifPfi(i32 %0, i32 %1, i32 %2, float %3, float addrspace(1)* nocapture readonly %4, i32 %5, float addrspace(1)* nocapture readonly %6, i32 %7, float %8, float addrspace(1)* nocapture %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = mul i32 %13, %18
  %20 = add i32 %19, %12
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = getelementptr i8, i8 addrspace(4)* %14, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !5, !invariant.load !6
  %26 = zext i16 %25 to i32
  %27 = mul i32 %22, %26
  %28 = add i32 %27, %21
  %29 = icmp slt i32 %20, %0
  %30 = icmp slt i32 %28, %1
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %175

32:                                               ; preds = %11
  %33 = icmp sgt i32 %2, 0
  br i1 %33, label %34, label %63

34:                                               ; preds = %32
  %35 = mul nsw i32 %28, %7
  %36 = and i32 %2, 7
  %37 = icmp ult i32 %2, 8
  br i1 %37, label %40, label %38

38:                                               ; preds = %34
  %39 = and i32 %2, -8
  br label %73

40:                                               ; preds = %73, %34
  %41 = phi float [ undef, %34 ], [ %171, %73 ]
  %42 = phi i32 [ 0, %34 ], [ %172, %73 ]
  %43 = phi float [ 0.000000e+00, %34 ], [ %171, %73 ]
  %44 = icmp eq i32 %36, 0
  br i1 %44, label %63, label %45

45:                                               ; preds = %40, %45
  %46 = phi i32 [ %60, %45 ], [ %42, %40 ]
  %47 = phi float [ %59, %45 ], [ %43, %40 ]
  %48 = phi i32 [ %61, %45 ], [ 0, %40 ]
  %49 = mul nsw i32 %46, %5
  %50 = add nsw i32 %49, %20
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %4, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !6
  %54 = add nsw i32 %46, %35
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %6, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7, !amdgpu.noclobber !6
  %58 = fmul contract float %53, %57
  %59 = fadd contract float %47, %58
  %60 = add nuw nsw i32 %46, 1
  %61 = add i32 %48, 1
  %62 = icmp eq i32 %61, %36
  br i1 %62, label %63, label %45, !llvm.loop !11

63:                                               ; preds = %40, %45, %32
  %64 = phi float [ 0.000000e+00, %32 ], [ %41, %40 ], [ %59, %45 ]
  %65 = fmul contract float %64, %3
  %66 = mul nsw i32 %28, %10
  %67 = add nsw i32 %66, %20
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %9, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !6
  %71 = fmul contract float %70, %8
  %72 = fadd contract float %65, %71
  store float %72, float addrspace(1)* %69, align 4, !tbaa !7
  br label %175

73:                                               ; preds = %73, %38
  %74 = phi i32 [ 0, %38 ], [ %172, %73 ]
  %75 = phi float [ 0.000000e+00, %38 ], [ %171, %73 ]
  %76 = phi i32 [ 0, %38 ], [ %173, %73 ]
  %77 = mul nsw i32 %74, %5
  %78 = add nsw i32 %77, %20
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %4, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !6
  %82 = add nsw i32 %74, %35
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %6, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !6
  %86 = fmul contract float %81, %85
  %87 = fadd contract float %75, %86
  %88 = or i32 %74, 1
  %89 = mul nsw i32 %88, %5
  %90 = add nsw i32 %89, %20
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %4, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !6
  %94 = add nsw i32 %88, %35
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %6, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !6
  %98 = fmul contract float %93, %97
  %99 = fadd contract float %87, %98
  %100 = or i32 %74, 2
  %101 = mul nsw i32 %100, %5
  %102 = add nsw i32 %101, %20
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %4, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !6
  %106 = add nsw i32 %100, %35
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %6, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !6
  %110 = fmul contract float %105, %109
  %111 = fadd contract float %99, %110
  %112 = or i32 %74, 3
  %113 = mul nsw i32 %112, %5
  %114 = add nsw i32 %113, %20
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %4, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7, !amdgpu.noclobber !6
  %118 = add nsw i32 %112, %35
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %6, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !6
  %122 = fmul contract float %117, %121
  %123 = fadd contract float %111, %122
  %124 = or i32 %74, 4
  %125 = mul nsw i32 %124, %5
  %126 = add nsw i32 %125, %20
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %4, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !7, !amdgpu.noclobber !6
  %130 = add nsw i32 %124, %35
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %6, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !7, !amdgpu.noclobber !6
  %134 = fmul contract float %129, %133
  %135 = fadd contract float %123, %134
  %136 = or i32 %74, 5
  %137 = mul nsw i32 %136, %5
  %138 = add nsw i32 %137, %20
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %4, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !7, !amdgpu.noclobber !6
  %142 = add nsw i32 %136, %35
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %6, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !7, !amdgpu.noclobber !6
  %146 = fmul contract float %141, %145
  %147 = fadd contract float %135, %146
  %148 = or i32 %74, 6
  %149 = mul nsw i32 %148, %5
  %150 = add nsw i32 %149, %20
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %4, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !7, !amdgpu.noclobber !6
  %154 = add nsw i32 %148, %35
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %6, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !7, !amdgpu.noclobber !6
  %158 = fmul contract float %153, %157
  %159 = fadd contract float %147, %158
  %160 = or i32 %74, 7
  %161 = mul nsw i32 %160, %5
  %162 = add nsw i32 %161, %20
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %4, i64 %163
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !7, !amdgpu.noclobber !6
  %166 = add nsw i32 %160, %35
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %6, i64 %167
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !7, !amdgpu.noclobber !6
  %170 = fmul contract float %165, %169
  %171 = fadd contract float %159, %170
  %172 = add nuw nsw i32 %74, 8
  %173 = add i32 %76, 8
  %174 = icmp eq i32 %173, %39
  br i1 %174, label %40, label %73, !llvm.loop !13

175:                                              ; preds = %63, %11
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
