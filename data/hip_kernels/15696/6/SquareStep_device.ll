; ModuleID = '../data/hip_kernels/15696/6/main.cu'
source_filename = "../data/hip_kernels/15696/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10SquareStepPhPjiiiii(i8 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %16, %4
  %26 = icmp slt i32 %24, %5
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %96

28:                                               ; preds = %7
  %29 = sdiv i32 %2, 2
  %30 = mul nsw i32 %16, %2
  %31 = and i32 %24, 1
  %32 = icmp eq i32 %31, 0
  %33 = mul nsw i32 %24, %29
  %34 = select i1 %32, i32 %30, i32 %33
  %35 = add nsw i32 %33, %29
  %36 = select i1 %32, i32 %35, i32 %30
  %37 = icmp ne i32 %34, 0
  %38 = zext i1 %37 to i32
  %39 = select i1 %37, i32 %29, i32 0
  %40 = sub nsw i32 %34, %39
  %41 = mul nsw i32 %40, %3
  %42 = add nsw i32 %41, %36
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %43
  %45 = load i8, i8 addrspace(1)* %44, align 1, !tbaa !7, !amdgpu.noclobber !5
  %46 = zext i8 %45 to i32
  %47 = select i1 %37, i32 %46, i32 0
  %48 = add nsw i32 %3, -1
  %49 = icmp ne i32 %34, %48
  %50 = zext i1 %49 to i32
  %51 = select i1 %49, i32 %29, i32 0
  %52 = add nsw i32 %51, %34
  %53 = mul nsw i32 %52, %3
  %54 = add nsw i32 %53, %36
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %55
  %57 = load i8, i8 addrspace(1)* %56, align 1, !tbaa !7, !amdgpu.noclobber !5
  %58 = zext i8 %57 to i32
  %59 = select i1 %49, i32 %58, i32 0
  %60 = add nuw nsw i32 %38, %50
  %61 = icmp ne i32 %36, 0
  %62 = zext i1 %61 to i32
  %63 = mul nsw i32 %34, %3
  %64 = add nsw i32 %63, %36
  %65 = select i1 %61, i32 %29, i32 0
  %66 = sub nsw i32 %64, %65
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %67
  %69 = load i8, i8 addrspace(1)* %68, align 1, !tbaa !7, !amdgpu.noclobber !5
  %70 = zext i8 %69 to i32
  %71 = select i1 %61, i32 %70, i32 0
  %72 = add nuw nsw i32 %60, %62
  %73 = icmp ne i32 %36, %48
  %74 = zext i1 %73 to i32
  %75 = select i1 %73, i32 %29, i32 0
  %76 = add nsw i32 %64, %75
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %77
  %79 = load i8, i8 addrspace(1)* %78, align 1, !tbaa !7, !amdgpu.noclobber !5
  %80 = zext i8 %79 to i32
  %81 = select i1 %73, i32 %80, i32 0
  %82 = add nuw nsw i32 %72, %74
  %83 = sext i32 %64 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !10, !amdgpu.noclobber !5
  %86 = shl nsw i32 %6, 1
  %87 = urem i32 %85, %86
  %88 = sub i32 %47, %6
  %89 = add i32 %88, %59
  %90 = add i32 %89, %71
  %91 = add i32 %90, %81
  %92 = add i32 %91, %87
  %93 = sdiv i32 %92, %82
  %94 = trunc i32 %93 to i8
  %95 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %83
  store i8 %94, i8 addrspace(1)* %95, align 1, !tbaa !7
  br label %96

96:                                               ; preds = %28, %7
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
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}
