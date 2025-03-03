; ModuleID = '../data/hip_kernels/17444/0/main.cu'
source_filename = "../data/hip_kernels/17444/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6kernelPfS_S_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = icmp sgt i32 %4, 0
  br i1 %15, label %16, label %137

16:                                               ; preds = %5
  %17 = and i32 %4, 7
  %18 = icmp ult i32 %4, 8
  br i1 %18, label %115, label %19

19:                                               ; preds = %16
  %20 = and i32 %4, -8
  br label %21

21:                                               ; preds = %21, %19
  %22 = phi float [ 0.000000e+00, %19 ], [ %111, %21 ]
  %23 = phi i32 [ 0, %19 ], [ %112, %21 ]
  %24 = phi i32 [ 0, %19 ], [ %113, %21 ]
  %25 = zext i32 %23 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !6
  %28 = mul nsw i32 %23, %3
  %29 = add nsw i32 %28, %14
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !6
  %33 = fmul contract float %27, %32
  %34 = fadd contract float %22, %33
  %35 = or i32 %23, 1
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !6
  %39 = mul nsw i32 %35, %3
  %40 = add nsw i32 %39, %14
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !6
  %44 = fmul contract float %38, %43
  %45 = fadd contract float %34, %44
  %46 = or i32 %23, 2
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !6
  %50 = mul nsw i32 %46, %3
  %51 = add nsw i32 %50, %14
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !6
  %55 = fmul contract float %49, %54
  %56 = fadd contract float %45, %55
  %57 = or i32 %23, 3
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7, !amdgpu.noclobber !6
  %61 = mul nsw i32 %57, %3
  %62 = add nsw i32 %61, %14
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %1, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !6
  %66 = fmul contract float %60, %65
  %67 = fadd contract float %56, %66
  %68 = or i32 %23, 4
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !6
  %72 = mul nsw i32 %68, %3
  %73 = add nsw i32 %72, %14
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !6
  %77 = fmul contract float %71, %76
  %78 = fadd contract float %67, %77
  %79 = or i32 %23, 5
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !6
  %83 = mul nsw i32 %79, %3
  %84 = add nsw i32 %83, %14
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %1, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !6
  %88 = fmul contract float %82, %87
  %89 = fadd contract float %78, %88
  %90 = or i32 %23, 6
  %91 = zext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !6
  %94 = mul nsw i32 %90, %3
  %95 = add nsw i32 %94, %14
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %1, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7, !amdgpu.noclobber !6
  %99 = fmul contract float %93, %98
  %100 = fadd contract float %89, %99
  %101 = or i32 %23, 7
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7, !amdgpu.noclobber !6
  %105 = mul nsw i32 %101, %3
  %106 = add nsw i32 %105, %14
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %1, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !6
  %110 = fmul contract float %104, %109
  %111 = fadd contract float %100, %110
  %112 = add nuw nsw i32 %23, 8
  %113 = add i32 %24, 8
  %114 = icmp eq i32 %113, %20
  br i1 %114, label %115, label %21, !llvm.loop !11

115:                                              ; preds = %21, %16
  %116 = phi float [ undef, %16 ], [ %111, %21 ]
  %117 = phi float [ 0.000000e+00, %16 ], [ %111, %21 ]
  %118 = phi i32 [ 0, %16 ], [ %112, %21 ]
  %119 = icmp eq i32 %17, 0
  br i1 %119, label %137, label %120

120:                                              ; preds = %115, %120
  %121 = phi float [ %133, %120 ], [ %117, %115 ]
  %122 = phi i32 [ %134, %120 ], [ %118, %115 ]
  %123 = phi i32 [ %135, %120 ], [ 0, %115 ]
  %124 = zext i32 %122 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %0, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !6
  %127 = mul nsw i32 %122, %3
  %128 = add nsw i32 %127, %14
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %1, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7, !amdgpu.noclobber !6
  %132 = fmul contract float %126, %131
  %133 = fadd contract float %121, %132
  %134 = add nuw nsw i32 %122, 1
  %135 = add i32 %123, 1
  %136 = icmp eq i32 %135, %17
  br i1 %136, label %137, label %120, !llvm.loop !13

137:                                              ; preds = %115, %120, %5
  %138 = phi float [ 0.000000e+00, %5 ], [ %116, %115 ], [ %133, %120 ]
  %139 = sext i32 %14 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %2, i64 %139
  store float %138, float addrspace(1)* %140, align 4, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
