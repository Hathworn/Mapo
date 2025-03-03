; ModuleID = '../data/hip_kernels/10321/6/main.cu'
source_filename = "../data/hip_kernels/10321/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

@d_vertices = protected addrspace(4) externally_initialized global [600 x %struct.HIP_vector_type] zeroinitializer, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([600 x %struct.HIP_vector_type] addrspace(4)* @d_vertices to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9cn_pnpolyPiP15HIP_vector_typeIfLj2EEi(i32 addrspace(1)* nocapture writeonly %0, %struct.HIP_vector_type addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = shl i32 %4, 5
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = add i32 %5, %6
  %8 = icmp slt i32 %7, %2
  br i1 %8, label %9, label %99

9:                                                ; preds = %3
  %10 = sext i32 %7 to i64
  %11 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %10, i32 0, i32 0, i32 0, i64 0
  %12 = load float, float addrspace(1)* %11, align 8
  %13 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %10, i32 0, i32 0, i32 0, i64 1
  %14 = load float, float addrspace(1)* %13, align 4
  %15 = load float, float addrspace(4)* getelementptr inbounds ([600 x %struct.HIP_vector_type], [600 x %struct.HIP_vector_type] addrspace(4)* @d_vertices, i64 0, i64 599, i32 0, i32 0, i32 0, i64 1), align 4
  br label %16

16:                                               ; preds = %93, %9
  %17 = phi float [ %15, %9 ], [ %75, %93 ]
  %18 = phi i32 [ 599, %9 ], [ %70, %93 ]
  %19 = phi i32 [ 0, %9 ], [ %95, %93 ]
  %20 = phi i32 [ 0, %9 ], [ %94, %93 ]
  %21 = zext i32 %19 to i64
  %22 = getelementptr inbounds [600 x %struct.HIP_vector_type], [600 x %struct.HIP_vector_type] addrspace(4)* @d_vertices, i64 0, i64 %21, i32 0, i32 0, i32 0, i64 0
  %23 = load float, float addrspace(4)* %22, align 8
  %24 = getelementptr inbounds [600 x %struct.HIP_vector_type], [600 x %struct.HIP_vector_type] addrspace(4)* @d_vertices, i64 0, i64 %21, i32 0, i32 0, i32 0, i64 1
  %25 = load float, float addrspace(4)* %24, align 4
  %26 = fcmp contract ule float %25, %14
  %27 = fcmp contract ogt float %17, %14
  %28 = xor i1 %26, %27
  br i1 %28, label %43, label %29

29:                                               ; preds = %16
  %30 = zext i32 %18 to i64
  %31 = getelementptr inbounds [600 x %struct.HIP_vector_type], [600 x %struct.HIP_vector_type] addrspace(4)* @d_vertices, i64 0, i64 %30, i32 0, i32 0, i32 0, i64 0
  %32 = load float, float addrspace(4)* %31, align 8
  %33 = fsub contract float %32, %23
  %34 = fsub contract float %17, %25
  %35 = fdiv contract float %33, %34
  %36 = fsub contract float %14, %25
  %37 = fmul contract float %36, %35
  %38 = fadd contract float %23, %37
  %39 = fcmp contract olt float %12, %38
  %40 = icmp eq i32 %20, 0
  %41 = zext i1 %40 to i32
  %42 = select i1 %39, i32 %41, i32 %20
  br label %43

43:                                               ; preds = %29, %16
  %44 = phi i32 [ %20, %16 ], [ %42, %29 ]
  %45 = add nuw nsw i32 %19, 1
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds [600 x %struct.HIP_vector_type], [600 x %struct.HIP_vector_type] addrspace(4)* @d_vertices, i64 0, i64 %46, i32 0, i32 0, i32 0, i64 0
  %48 = load float, float addrspace(4)* %47, align 8
  %49 = getelementptr inbounds [600 x %struct.HIP_vector_type], [600 x %struct.HIP_vector_type] addrspace(4)* @d_vertices, i64 0, i64 %46, i32 0, i32 0, i32 0, i64 1
  %50 = load float, float addrspace(4)* %49, align 4
  %51 = fcmp contract ule float %50, %14
  %52 = fcmp contract ogt float %25, %14
  %53 = xor i1 %51, %52
  br i1 %53, label %68, label %54

54:                                               ; preds = %43
  %55 = zext i32 %19 to i64
  %56 = getelementptr inbounds [600 x %struct.HIP_vector_type], [600 x %struct.HIP_vector_type] addrspace(4)* @d_vertices, i64 0, i64 %55, i32 0, i32 0, i32 0, i64 0
  %57 = load float, float addrspace(4)* %56, align 8
  %58 = fsub contract float %57, %48
  %59 = fsub contract float %25, %50
  %60 = fdiv contract float %58, %59
  %61 = fsub contract float %14, %50
  %62 = fmul contract float %61, %60
  %63 = fadd contract float %48, %62
  %64 = fcmp contract olt float %12, %63
  %65 = icmp eq i32 %44, 0
  %66 = zext i1 %65 to i32
  %67 = select i1 %64, i32 %66, i32 %44
  br label %68

68:                                               ; preds = %54, %43
  %69 = phi i32 [ %44, %43 ], [ %67, %54 ]
  %70 = add nuw nsw i32 %19, 2
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds [600 x %struct.HIP_vector_type], [600 x %struct.HIP_vector_type] addrspace(4)* @d_vertices, i64 0, i64 %71, i32 0, i32 0, i32 0, i64 0
  %73 = load float, float addrspace(4)* %72, align 8
  %74 = getelementptr inbounds [600 x %struct.HIP_vector_type], [600 x %struct.HIP_vector_type] addrspace(4)* @d_vertices, i64 0, i64 %71, i32 0, i32 0, i32 0, i64 1
  %75 = load float, float addrspace(4)* %74, align 4
  %76 = fcmp contract ule float %75, %14
  %77 = fcmp contract ogt float %50, %14
  %78 = xor i1 %76, %77
  br i1 %78, label %93, label %79

79:                                               ; preds = %68
  %80 = zext i32 %45 to i64
  %81 = getelementptr inbounds [600 x %struct.HIP_vector_type], [600 x %struct.HIP_vector_type] addrspace(4)* @d_vertices, i64 0, i64 %80, i32 0, i32 0, i32 0, i64 0
  %82 = load float, float addrspace(4)* %81, align 8
  %83 = fsub contract float %82, %73
  %84 = fsub contract float %50, %75
  %85 = fdiv contract float %83, %84
  %86 = fsub contract float %14, %75
  %87 = fmul contract float %86, %85
  %88 = fadd contract float %73, %87
  %89 = fcmp contract olt float %12, %88
  %90 = icmp eq i32 %69, 0
  %91 = zext i1 %90 to i32
  %92 = select i1 %89, i32 %91, i32 %69
  br label %93

93:                                               ; preds = %79, %68
  %94 = phi i32 [ %69, %68 ], [ %92, %79 ]
  %95 = add nuw nsw i32 %19, 3
  %96 = icmp eq i32 %95, 600
  br i1 %96, label %97, label %16, !llvm.loop !5

97:                                               ; preds = %93
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %10
  store i32 %94, i32 addrspace(1)* %98, align 4, !tbaa !7
  br label %99

99:                                               ; preds = %97, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
