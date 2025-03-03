; ModuleID = '../data/hip_kernels/3114/4/main.cu'
source_filename = "../data/hip_kernels/3114/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24ColumnReduceSimpleKernelPKfPfiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = freeze i32 %14
  %16 = freeze i32 %4
  %17 = sdiv i32 %15, %16
  %18 = mul i32 %17, %16
  %19 = sub i32 %15, %18
  %20 = icmp slt i32 %17, %2
  br i1 %20, label %21, label %126

21:                                               ; preds = %5
  %22 = mul i32 %17, %4
  %23 = mul i32 %22, %3
  %24 = add i32 %19, %23
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !6
  %28 = add i32 %24, %4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !6
  %32 = fadd contract float %27, %31
  %33 = icmp sgt i32 %3, 2
  br i1 %33, label %34, label %59

34:                                               ; preds = %21
  %35 = add i32 %3, -2
  %36 = add i32 %3, -3
  %37 = and i32 %35, 7
  %38 = icmp ult i32 %36, 7
  br i1 %38, label %41, label %39

39:                                               ; preds = %34
  %40 = and i32 %35, -8
  br label %64

41:                                               ; preds = %64, %34
  %42 = phi float [ undef, %34 ], [ %122, %64 ]
  %43 = phi i32 [ 2, %34 ], [ %123, %64 ]
  %44 = phi float [ %32, %34 ], [ %122, %64 ]
  %45 = icmp eq i32 %37, 0
  br i1 %45, label %59, label %46

46:                                               ; preds = %41, %46
  %47 = phi i32 [ %56, %46 ], [ %43, %41 ]
  %48 = phi float [ %55, %46 ], [ %44, %41 ]
  %49 = phi i32 [ %57, %46 ], [ 0, %41 ]
  %50 = mul nsw i32 %47, %4
  %51 = add i32 %24, %50
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !6
  %55 = fadd contract float %48, %54
  %56 = add nuw nsw i32 %47, 1
  %57 = add i32 %49, 1
  %58 = icmp eq i32 %57, %37
  br i1 %58, label %59, label %46, !llvm.loop !11

59:                                               ; preds = %41, %46, %21
  %60 = phi float [ %32, %21 ], [ %42, %41 ], [ %55, %46 ]
  %61 = add nsw i32 %22, %19
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %1, i64 %62
  store float %60, float addrspace(1)* %63, align 4, !tbaa !7
  br label %126

64:                                               ; preds = %64, %39
  %65 = phi i32 [ 2, %39 ], [ %123, %64 ]
  %66 = phi float [ %32, %39 ], [ %122, %64 ]
  %67 = phi i32 [ 0, %39 ], [ %124, %64 ]
  %68 = mul nsw i32 %65, %4
  %69 = add i32 %24, %68
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7, !amdgpu.noclobber !6
  %73 = fadd contract float %66, %72
  %74 = or i32 %65, 1
  %75 = mul nsw i32 %74, %4
  %76 = add i32 %24, %75
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !6
  %80 = fadd contract float %73, %79
  %81 = add nuw nsw i32 %65, 2
  %82 = mul nsw i32 %81, %4
  %83 = add i32 %24, %82
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !6
  %87 = fadd contract float %80, %86
  %88 = add nuw nsw i32 %65, 3
  %89 = mul nsw i32 %88, %4
  %90 = add i32 %24, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !6
  %94 = fadd contract float %87, %93
  %95 = add nuw nsw i32 %65, 4
  %96 = mul nsw i32 %95, %4
  %97 = add i32 %24, %96
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !6
  %101 = fadd contract float %94, %100
  %102 = add nuw nsw i32 %65, 5
  %103 = mul nsw i32 %102, %4
  %104 = add i32 %24, %103
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !6
  %108 = fadd contract float %101, %107
  %109 = add nuw nsw i32 %65, 6
  %110 = mul nsw i32 %109, %4
  %111 = add i32 %24, %110
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7, !amdgpu.noclobber !6
  %115 = fadd contract float %108, %114
  %116 = add nuw nsw i32 %65, 7
  %117 = mul nsw i32 %116, %4
  %118 = add i32 %24, %117
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %0, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !6
  %122 = fadd contract float %115, %121
  %123 = add nuw nsw i32 %65, 8
  %124 = add i32 %67, 8
  %125 = icmp eq i32 %124, %40
  br i1 %125, label %41, label %64, !llvm.loop !13

126:                                              ; preds = %5, %59
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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
