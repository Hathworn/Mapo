; ModuleID = '../data/hip_kernels/17581/17/main.cu'
source_filename = "../data/hip_kernels/17581/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9boxFilterPhS_jji(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp sgt i32 %14, 0
  br i1 %23, label %24, label %118

24:                                               ; preds = %5
  %25 = add i32 %2, -1
  %26 = icmp ult i32 %14, %25
  %27 = icmp sgt i32 %22, 0
  %28 = select i1 %26, i1 %27, i1 false
  %29 = add i32 %3, -1
  %30 = icmp ult i32 %22, %29
  %31 = select i1 %28, i1 %30, i1 false
  %32 = icmp sgt i32 %4, 0
  %33 = select i1 %31, i1 %32, i1 false
  br i1 %33, label %34, label %118

34:                                               ; preds = %24
  %35 = mul i32 %22, %2
  %36 = add i32 %35, %14
  %37 = mul i32 %36, %4
  %38 = add nuw nsw i32 %22, 1
  %39 = mul i32 %38, %2
  %40 = add i32 %39, %14
  %41 = add i32 %40, -1
  %42 = mul i32 %41, %4
  %43 = add nsw i32 %22, -1
  %44 = mul i32 %43, %2
  %45 = add i32 %44, %14
  %46 = add i32 %45, -1
  %47 = mul i32 %46, %4
  %48 = mul i32 %45, %4
  %49 = add i32 %45, 1
  %50 = mul i32 %49, %4
  %51 = add i32 %36, -1
  %52 = mul i32 %51, %4
  %53 = add i32 %36, 1
  %54 = mul i32 %53, %4
  %55 = mul i32 %40, %4
  %56 = add i32 %40, 1
  %57 = mul i32 %56, %4
  br label %58

58:                                               ; preds = %34, %58
  %59 = phi i32 [ 0, %34 ], [ %116, %58 ]
  %60 = add i32 %47, %59
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %61
  %63 = load i8, i8 addrspace(1)* %62, align 1, !tbaa !7
  %64 = uitofp i8 %63 to float
  %65 = add i32 %48, %59
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %66
  %68 = load i8, i8 addrspace(1)* %67, align 1, !tbaa !7
  %69 = uitofp i8 %68 to float
  %70 = fadd contract float %64, %69
  %71 = add i32 %50, %59
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %72
  %74 = load i8, i8 addrspace(1)* %73, align 1, !tbaa !7
  %75 = uitofp i8 %74 to float
  %76 = fadd contract float %70, %75
  %77 = add i32 %52, %59
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %78
  %80 = load i8, i8 addrspace(1)* %79, align 1, !tbaa !7
  %81 = uitofp i8 %80 to float
  %82 = fadd contract float %76, %81
  %83 = add i32 %37, %59
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %84
  %86 = load i8, i8 addrspace(1)* %85, align 1, !tbaa !7
  %87 = uitofp i8 %86 to float
  %88 = fadd contract float %82, %87
  %89 = add i32 %54, %59
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %90
  %92 = load i8, i8 addrspace(1)* %91, align 1, !tbaa !7
  %93 = uitofp i8 %92 to float
  %94 = fadd contract float %88, %93
  %95 = add i32 %42, %59
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %96
  %98 = load i8, i8 addrspace(1)* %97, align 1, !tbaa !7
  %99 = uitofp i8 %98 to float
  %100 = fadd contract float %94, %99
  %101 = add i32 %55, %59
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %102
  %104 = load i8, i8 addrspace(1)* %103, align 1, !tbaa !7
  %105 = uitofp i8 %104 to float
  %106 = fadd contract float %100, %105
  %107 = add i32 %57, %59
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %108
  %110 = load i8, i8 addrspace(1)* %109, align 1, !tbaa !7
  %111 = uitofp i8 %110 to float
  %112 = fadd contract float %106, %111
  %113 = fdiv contract float %112, 9.000000e+00
  %114 = fptoui float %113 to i8
  %115 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %84
  store i8 %114, i8 addrspace(1)* %115, align 1, !tbaa !7
  %116 = add nuw nsw i32 %59, 1
  %117 = icmp eq i32 %116, %4
  br i1 %117, label %118, label %58, !llvm.loop !10

118:                                              ; preds = %58, %24, %5
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
