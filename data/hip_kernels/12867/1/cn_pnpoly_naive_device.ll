; ModuleID = '../data/hip_kernels/12867/1/main.cu'
source_filename = "../data/hip_kernels/12867/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

@d_vertices = protected addrspace(4) externally_initialized global [600 x %struct.HIP_vector_type] zeroinitializer, align 16
@d_slopes = protected local_unnamed_addr addrspace(4) externally_initialized global [600 x float] zeroinitializer, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([600 x %struct.HIP_vector_type] addrspace(4)* @d_vertices to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15cn_pnpoly_naivePiP15HIP_vector_typeIfLj2EEi(i32 addrspace(1)* nocapture writeonly %0, %struct.HIP_vector_type addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, %2
  br i1 %13, label %14, label %104

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %15, i32 0, i32 0, i32 0, i64 0
  %17 = load float, float addrspace(1)* %16, align 8, !amdgpu.noclobber !5
  %18 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %15, i32 0, i32 0, i32 0, i64 1
  %19 = load float, float addrspace(1)* %18, align 4, !amdgpu.noclobber !5
  %20 = load float, float addrspace(4)* getelementptr inbounds ([600 x %struct.HIP_vector_type], [600 x %struct.HIP_vector_type] addrspace(4)* @d_vertices, i64 0, i64 599, i32 0, i32 0, i32 0, i64 1), align 4
  br label %23

21:                                               ; preds = %100
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  store i32 %101, i32 addrspace(1)* %22, align 4, !tbaa !7
  br label %104

23:                                               ; preds = %100, %14
  %24 = phi float [ %20, %14 ], [ %82, %100 ]
  %25 = phi i32 [ 0, %14 ], [ %101, %100 ]
  %26 = phi i32 [ 599, %14 ], [ %77, %100 ]
  %27 = phi i32 [ 0, %14 ], [ %102, %100 ]
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds [600 x %struct.HIP_vector_type], [600 x %struct.HIP_vector_type] addrspace(4)* @d_vertices, i64 0, i64 %28, i32 0, i32 0, i32 0, i64 0
  %30 = load float, float addrspace(4)* %29, align 8
  %31 = getelementptr inbounds [600 x %struct.HIP_vector_type], [600 x %struct.HIP_vector_type] addrspace(4)* @d_vertices, i64 0, i64 %28, i32 0, i32 0, i32 0, i64 1
  %32 = load float, float addrspace(4)* %31, align 4
  %33 = fcmp contract ule float %32, %19
  %34 = fcmp contract ogt float %24, %19
  %35 = xor i1 %33, %34
  br i1 %35, label %50, label %36

36:                                               ; preds = %23
  %37 = zext i32 %26 to i64
  %38 = getelementptr inbounds [600 x %struct.HIP_vector_type], [600 x %struct.HIP_vector_type] addrspace(4)* @d_vertices, i64 0, i64 %37, i32 0, i32 0, i32 0, i64 0
  %39 = load float, float addrspace(4)* %38, align 8
  %40 = fsub contract float %39, %30
  %41 = fsub contract float %24, %32
  %42 = fdiv contract float %40, %41
  %43 = fsub contract float %19, %32
  %44 = fmul contract float %43, %42
  %45 = fadd contract float %30, %44
  %46 = fcmp contract olt float %17, %45
  %47 = icmp eq i32 %25, 0
  %48 = zext i1 %47 to i32
  %49 = select i1 %46, i32 %48, i32 %25
  br label %50

50:                                               ; preds = %36, %23
  %51 = phi i32 [ %25, %23 ], [ %49, %36 ]
  %52 = add nuw nsw i32 %27, 1
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds [600 x %struct.HIP_vector_type], [600 x %struct.HIP_vector_type] addrspace(4)* @d_vertices, i64 0, i64 %53, i32 0, i32 0, i32 0, i64 0
  %55 = load float, float addrspace(4)* %54, align 8
  %56 = getelementptr inbounds [600 x %struct.HIP_vector_type], [600 x %struct.HIP_vector_type] addrspace(4)* @d_vertices, i64 0, i64 %53, i32 0, i32 0, i32 0, i64 1
  %57 = load float, float addrspace(4)* %56, align 4
  %58 = fcmp contract ule float %57, %19
  %59 = fcmp contract ogt float %32, %19
  %60 = xor i1 %58, %59
  br i1 %60, label %75, label %61

61:                                               ; preds = %50
  %62 = zext i32 %27 to i64
  %63 = getelementptr inbounds [600 x %struct.HIP_vector_type], [600 x %struct.HIP_vector_type] addrspace(4)* @d_vertices, i64 0, i64 %62, i32 0, i32 0, i32 0, i64 0
  %64 = load float, float addrspace(4)* %63, align 8
  %65 = fsub contract float %64, %55
  %66 = fsub contract float %32, %57
  %67 = fdiv contract float %65, %66
  %68 = fsub contract float %19, %57
  %69 = fmul contract float %68, %67
  %70 = fadd contract float %55, %69
  %71 = fcmp contract olt float %17, %70
  %72 = icmp eq i32 %51, 0
  %73 = zext i1 %72 to i32
  %74 = select i1 %71, i32 %73, i32 %51
  br label %75

75:                                               ; preds = %61, %50
  %76 = phi i32 [ %51, %50 ], [ %74, %61 ]
  %77 = add nuw nsw i32 %27, 2
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds [600 x %struct.HIP_vector_type], [600 x %struct.HIP_vector_type] addrspace(4)* @d_vertices, i64 0, i64 %78, i32 0, i32 0, i32 0, i64 0
  %80 = load float, float addrspace(4)* %79, align 8
  %81 = getelementptr inbounds [600 x %struct.HIP_vector_type], [600 x %struct.HIP_vector_type] addrspace(4)* @d_vertices, i64 0, i64 %78, i32 0, i32 0, i32 0, i64 1
  %82 = load float, float addrspace(4)* %81, align 4
  %83 = fcmp contract ule float %82, %19
  %84 = fcmp contract ogt float %57, %19
  %85 = xor i1 %83, %84
  br i1 %85, label %100, label %86

86:                                               ; preds = %75
  %87 = zext i32 %52 to i64
  %88 = getelementptr inbounds [600 x %struct.HIP_vector_type], [600 x %struct.HIP_vector_type] addrspace(4)* @d_vertices, i64 0, i64 %87, i32 0, i32 0, i32 0, i64 0
  %89 = load float, float addrspace(4)* %88, align 8
  %90 = fsub contract float %89, %80
  %91 = fsub contract float %57, %82
  %92 = fdiv contract float %90, %91
  %93 = fsub contract float %19, %82
  %94 = fmul contract float %93, %92
  %95 = fadd contract float %80, %94
  %96 = fcmp contract olt float %17, %95
  %97 = icmp eq i32 %76, 0
  %98 = zext i1 %97 to i32
  %99 = select i1 %96, i32 %98, i32 %76
  br label %100

100:                                              ; preds = %86, %75
  %101 = phi i32 [ %76, %75 ], [ %99, %86 ]
  %102 = add nuw nsw i32 %27, 3
  %103 = icmp eq i32 %102, 600
  br i1 %103, label %21, label %23, !llvm.loop !11

104:                                              ; preds = %21, %3
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
