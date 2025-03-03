; ModuleID = '../data/hip_kernels/6176/4/main.cu'
source_filename = "../data/hip_kernels/6176/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20compute_squared_normPfiiiS_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp ult i32 %14, %1
  br i1 %15, label %16, label %116

16:                                               ; preds = %5
  %17 = icmp sgt i32 %3, 0
  br i1 %17, label %18, label %42

18:                                               ; preds = %16
  %19 = and i32 %3, 7
  %20 = icmp ult i32 %3, 8
  br i1 %20, label %23, label %21

21:                                               ; preds = %18
  %22 = and i32 %3, -8
  br label %46

23:                                               ; preds = %46, %18
  %24 = phi float [ undef, %18 ], [ %112, %46 ]
  %25 = phi float [ 0.000000e+00, %18 ], [ %112, %46 ]
  %26 = phi i32 [ 0, %18 ], [ %113, %46 ]
  %27 = icmp eq i32 %19, 0
  br i1 %27, label %42, label %28

28:                                               ; preds = %23, %28
  %29 = phi float [ %38, %28 ], [ %25, %23 ]
  %30 = phi i32 [ %39, %28 ], [ %26, %23 ]
  %31 = phi i32 [ %40, %28 ], [ 0, %23 ]
  %32 = mul nsw i32 %30, %2
  %33 = add i32 %32, %14
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = fmul contract float %36, %36
  %38 = fadd contract float %29, %37
  %39 = add nuw nsw i32 %30, 1
  %40 = add i32 %31, 1
  %41 = icmp eq i32 %40, %19
  br i1 %41, label %42, label %28, !llvm.loop !11

42:                                               ; preds = %23, %28, %16
  %43 = phi float [ 0.000000e+00, %16 ], [ %24, %23 ], [ %38, %28 ]
  %44 = zext i32 %14 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %4, i64 %44
  store float %43, float addrspace(1)* %45, align 4, !tbaa !7
  br label %116

46:                                               ; preds = %46, %21
  %47 = phi float [ 0.000000e+00, %21 ], [ %112, %46 ]
  %48 = phi i32 [ 0, %21 ], [ %113, %46 ]
  %49 = phi i32 [ 0, %21 ], [ %114, %46 ]
  %50 = mul nsw i32 %48, %2
  %51 = add i32 %50, %14
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !5
  %55 = fmul contract float %54, %54
  %56 = fadd contract float %47, %55
  %57 = or i32 %48, 1
  %58 = mul nsw i32 %57, %2
  %59 = add i32 %58, %14
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !5
  %63 = fmul contract float %62, %62
  %64 = fadd contract float %56, %63
  %65 = or i32 %48, 2
  %66 = mul nsw i32 %65, %2
  %67 = add i32 %66, %14
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !5
  %71 = fmul contract float %70, %70
  %72 = fadd contract float %64, %71
  %73 = or i32 %48, 3
  %74 = mul nsw i32 %73, %2
  %75 = add i32 %74, %14
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !5
  %79 = fmul contract float %78, %78
  %80 = fadd contract float %72, %79
  %81 = or i32 %48, 4
  %82 = mul nsw i32 %81, %2
  %83 = add i32 %82, %14
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !5
  %87 = fmul contract float %86, %86
  %88 = fadd contract float %80, %87
  %89 = or i32 %48, 5
  %90 = mul nsw i32 %89, %2
  %91 = add i32 %90, %14
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7, !amdgpu.noclobber !5
  %95 = fmul contract float %94, %94
  %96 = fadd contract float %88, %95
  %97 = or i32 %48, 6
  %98 = mul nsw i32 %97, %2
  %99 = add i32 %98, %14
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7, !amdgpu.noclobber !5
  %103 = fmul contract float %102, %102
  %104 = fadd contract float %96, %103
  %105 = or i32 %48, 7
  %106 = mul nsw i32 %105, %2
  %107 = add i32 %106, %14
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %0, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7, !amdgpu.noclobber !5
  %111 = fmul contract float %110, %110
  %112 = fadd contract float %104, %111
  %113 = add nuw nsw i32 %48, 8
  %114 = add i32 %49, 8
  %115 = icmp eq i32 %114, %22
  br i1 %115, label %23, label %46, !llvm.loop !13

116:                                              ; preds = %42, %5
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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
