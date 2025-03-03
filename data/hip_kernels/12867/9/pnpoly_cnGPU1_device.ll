; ModuleID = '../data/hip_kernels/12867/9/main.cu'
source_filename = "../data/hip_kernels/12867/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13pnpoly_cnGPU1PKfS0_S0_S0_Pcii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i8 addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %5
  br i1 %17, label %18, label %134

18:                                               ; preds = %7
  %19 = icmp sgt i32 %6, 0
  br i1 %19, label %22, label %20

20:                                               ; preds = %18
  %21 = sext i32 %16 to i64
  br label %128

22:                                               ; preds = %18
  %23 = add i32 %6, -1
  %24 = sext i32 %16 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %1, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !5
  %27 = getelementptr inbounds float, float addrspace(1)* %0, i64 %24
  %28 = and i32 %6, 1
  %29 = icmp eq i32 %23, 0
  br i1 %29, label %97, label %30

30:                                               ; preds = %22
  %31 = and i32 %6, -2
  br label %32

32:                                               ; preds = %90, %30
  %33 = phi i32 [ 0, %30 ], [ %91, %90 ]
  %34 = phi i32 [ %23, %30 ], [ %64, %90 ]
  %35 = phi i32 [ 0, %30 ], [ %92, %90 ]
  %36 = phi i32 [ 0, %30 ], [ %93, %90 ]
  %37 = zext i32 %35 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %3, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = fcmp contract ule float %39, %26
  %41 = sext i32 %34 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = fcmp contract ogt float %43, %26
  %45 = xor i1 %40, %44
  br i1 %45, label %62, label %46

46:                                               ; preds = %32
  %47 = load float, float addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = getelementptr inbounds float, float addrspace(1)* %2, i64 %41
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !5
  %50 = getelementptr inbounds float, float addrspace(1)* %2, i64 %37
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !5
  %52 = fsub contract float %49, %51
  %53 = fsub contract float %26, %39
  %54 = fmul contract float %53, %52
  %55 = fsub contract float %43, %39
  %56 = fdiv contract float %54, %55
  %57 = fadd contract float %51, %56
  %58 = fcmp contract olt float %47, %57
  %59 = icmp eq i32 %33, 0
  %60 = zext i1 %59 to i32
  %61 = select i1 %58, i32 %60, i32 %33
  br label %62

62:                                               ; preds = %46, %32
  %63 = phi i32 [ %33, %32 ], [ %61, %46 ]
  %64 = or i32 %35, 1
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %3, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !5
  %68 = fcmp contract ule float %67, %26
  %69 = zext i32 %35 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %3, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !5
  %72 = fcmp contract ogt float %71, %26
  %73 = xor i1 %68, %72
  br i1 %73, label %90, label %74

74:                                               ; preds = %62
  %75 = load float, float addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !5
  %76 = getelementptr inbounds float, float addrspace(1)* %2, i64 %69
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !5
  %78 = getelementptr inbounds float, float addrspace(1)* %2, i64 %65
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !5
  %80 = fsub contract float %77, %79
  %81 = fsub contract float %26, %67
  %82 = fmul contract float %81, %80
  %83 = fsub contract float %71, %67
  %84 = fdiv contract float %82, %83
  %85 = fadd contract float %79, %84
  %86 = fcmp contract olt float %75, %85
  %87 = icmp eq i32 %63, 0
  %88 = zext i1 %87 to i32
  %89 = select i1 %86, i32 %88, i32 %63
  br label %90

90:                                               ; preds = %74, %62
  %91 = phi i32 [ %63, %62 ], [ %89, %74 ]
  %92 = add nuw nsw i32 %35, 2
  %93 = add i32 %36, 2
  %94 = icmp eq i32 %93, %31
  br i1 %94, label %95, label %32, !llvm.loop !11

95:                                               ; preds = %90
  %96 = zext i32 %92 to i64
  br label %97

97:                                               ; preds = %95, %22
  %98 = phi i32 [ undef, %22 ], [ %91, %95 ]
  %99 = phi i32 [ 0, %22 ], [ %91, %95 ]
  %100 = phi i32 [ %23, %22 ], [ %64, %95 ]
  %101 = phi i64 [ 0, %22 ], [ %96, %95 ]
  %102 = icmp eq i32 %28, 0
  br i1 %102, label %128, label %103

103:                                              ; preds = %97
  %104 = getelementptr inbounds float, float addrspace(1)* %3, i64 %101
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !5
  %106 = fcmp contract ule float %105, %26
  %107 = sext i32 %100 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %3, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !5
  %110 = fcmp contract ogt float %109, %26
  %111 = xor i1 %106, %110
  br i1 %111, label %128, label %112

112:                                              ; preds = %103
  %113 = load float, float addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !5
  %114 = getelementptr inbounds float, float addrspace(1)* %2, i64 %107
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7, !amdgpu.noclobber !5
  %116 = getelementptr inbounds float, float addrspace(1)* %2, i64 %101
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7, !amdgpu.noclobber !5
  %118 = fsub contract float %115, %117
  %119 = fsub contract float %26, %105
  %120 = fmul contract float %119, %118
  %121 = fsub contract float %109, %105
  %122 = fdiv contract float %120, %121
  %123 = fadd contract float %117, %122
  %124 = fcmp contract olt float %113, %123
  %125 = icmp eq i32 %99, 0
  %126 = zext i1 %125 to i32
  %127 = select i1 %124, i32 %126, i32 %99
  br label %128

128:                                              ; preds = %97, %112, %103, %20
  %129 = phi i64 [ %21, %20 ], [ %24, %103 ], [ %24, %112 ], [ %24, %97 ]
  %130 = phi i32 [ 0, %20 ], [ %98, %97 ], [ %99, %103 ], [ %127, %112 ]
  %131 = trunc i32 %130 to i8
  %132 = and i8 %131, 1
  %133 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %129
  store i8 %132, i8 addrspace(1)* %133, align 1, !tbaa !13
  br label %134

134:                                              ; preds = %128, %7
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!9, !9, i64 0}
