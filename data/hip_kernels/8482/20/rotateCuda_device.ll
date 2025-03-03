; ModuleID = '../data/hip_kernels/8482/20/main.cu'
source_filename = "../data/hip_kernels/8482/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10rotateCudaPKhjPhjffjjff(i8 addrspace(1)* nocapture readonly %0, i32 %1, i8 addrspace(1)* nocapture writeonly %2, i32 %3, float %4, float %5, i32 %6, i32 %7, float %8, float %9) local_unnamed_addr #0 {
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %12, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %17, %18
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 2, !range !4, !invariant.load !5
  %24 = zext i16 %23 to i32
  %25 = mul i32 %20, %24
  %26 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %27 = add i32 %25, %26
  %28 = icmp ult i32 %19, %6
  %29 = icmp ult i32 %27, %7
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %97

31:                                               ; preds = %10
  %32 = uitofp i32 %19 to float
  %33 = fmul contract float %32, %8
  %34 = fadd contract float %33, %4
  %35 = uitofp i32 %27 to float
  %36 = fmul contract float %35, %9
  %37 = fadd contract float %34, %36
  %38 = fmul contract float %32, %9
  %39 = fsub contract float %5, %38
  %40 = fmul contract float %35, %8
  %41 = fadd contract float %39, %40
  %42 = fptosi float %37 to i32
  %43 = fptosi float %41 to i32
  %44 = mul i32 %27, %3
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %45
  %47 = zext i32 %19 to i64
  %48 = getelementptr inbounds i8, i8 addrspace(1)* %46, i64 %47
  %49 = icmp slt i32 %42, 0
  br i1 %49, label %95, label %50

50:                                               ; preds = %31
  %51 = add i32 %6, -1
  %52 = icmp ugt i32 %51, %42
  %53 = icmp sgt i32 %43, -1
  %54 = select i1 %52, i1 %53, i1 false
  %55 = add i32 %7, -1
  %56 = icmp ugt i32 %55, %43
  %57 = select i1 %54, i1 %56, i1 false
  br i1 %57, label %58, label %95

58:                                               ; preds = %50
  %59 = mul i32 %43, %1
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %60
  %62 = zext i32 %42 to i64
  %63 = getelementptr inbounds i8, i8 addrspace(1)* %61, i64 %62
  %64 = sitofp i32 %42 to float
  %65 = fsub contract float %37, %64
  %66 = sitofp i32 %43 to float
  %67 = fsub contract float %41, %66
  %68 = load i8, i8 addrspace(1)* %63, align 1, !tbaa !7, !amdgpu.noclobber !5
  %69 = uitofp i8 %68 to float
  %70 = fsub contract float 1.000000e+00, %65
  %71 = fmul contract float %70, %69
  %72 = fsub contract float 1.000000e+00, %67
  %73 = fmul contract float %72, %71
  %74 = getelementptr inbounds i8, i8 addrspace(1)* %63, i64 1
  %75 = load i8, i8 addrspace(1)* %74, align 1, !tbaa !7, !amdgpu.noclobber !5
  %76 = uitofp i8 %75 to float
  %77 = fmul contract float %65, %76
  %78 = fmul contract float %72, %77
  %79 = fadd contract float %73, %78
  %80 = zext i32 %1 to i64
  %81 = getelementptr inbounds i8, i8 addrspace(1)* %63, i64 %80
  %82 = load i8, i8 addrspace(1)* %81, align 1, !tbaa !7, !amdgpu.noclobber !5
  %83 = uitofp i8 %82 to float
  %84 = fmul contract float %70, %83
  %85 = fmul contract float %67, %84
  %86 = fadd contract float %79, %85
  %87 = getelementptr inbounds i8, i8 addrspace(1)* %81, i64 1
  %88 = load i8, i8 addrspace(1)* %87, align 1, !tbaa !7, !amdgpu.noclobber !5
  %89 = uitofp i8 %88 to float
  %90 = fmul contract float %65, %89
  %91 = fmul contract float %67, %90
  %92 = fadd contract float %86, %91
  %93 = fadd contract float %92, 5.000000e-01
  %94 = fptoui float %93 to i8
  br label %95

95:                                               ; preds = %31, %50, %58
  %96 = phi i8 [ %94, %58 ], [ 0, %50 ], [ 0, %31 ]
  store i8 %96, i8 addrspace(1)* %48, align 1, !tbaa !7
  br label %97

97:                                               ; preds = %95, %10
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
