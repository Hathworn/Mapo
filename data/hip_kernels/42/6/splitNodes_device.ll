; ModuleID = '../data/hip_kernels/42/6/main.cu'
source_filename = "../data/hip_kernels/42/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z10splitNodesPiS_ii(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %2
  br i1 %14, label %15, label %84

15:                                               ; preds = %4
  %16 = add nsw i32 %13, %3
  %17 = shl nsw i32 %16, 1
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = and i32 %20, 1073741824
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %84, label %23

23:                                               ; preds = %15
  %24 = atomicrmw add i32 addrspace(1)* %1, i32 8 syncscope("agent-one-as") monotonic, align 4
  %25 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7
  %26 = and i32 %25, -1073741824
  %27 = and i32 %24, 1073741823
  %28 = or i32 %26, %27
  store i32 %28, i32 addrspace(1)* %19, align 4, !tbaa !7
  %29 = shl nsw i32 %24, 1
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  store i32 0, i32 addrspace(1)* %31, align 4, !tbaa !7
  %32 = add nuw nsw i32 %29, 1
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %33
  store i32 0, i32 addrspace(1)* %34, align 4, !tbaa !7
  %35 = shl i32 %24, 1
  %36 = add i32 %35, 2
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %37
  store i32 0, i32 addrspace(1)* %38, align 4, !tbaa !7
  %39 = add i32 %35, 3
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %40
  store i32 0, i32 addrspace(1)* %41, align 4, !tbaa !7
  %42 = shl i32 %24, 1
  %43 = add i32 %42, 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %44
  store i32 0, i32 addrspace(1)* %45, align 4, !tbaa !7
  %46 = add i32 %42, 5
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %47
  store i32 0, i32 addrspace(1)* %48, align 4, !tbaa !7
  %49 = shl i32 %24, 1
  %50 = add i32 %49, 6
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %51
  store i32 0, i32 addrspace(1)* %52, align 4, !tbaa !7
  %53 = add i32 %49, 7
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %54
  store i32 0, i32 addrspace(1)* %55, align 4, !tbaa !7
  %56 = shl i32 %24, 1
  %57 = add i32 %56, 8
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %58
  store i32 0, i32 addrspace(1)* %59, align 4, !tbaa !7
  %60 = add i32 %56, 9
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %61
  store i32 0, i32 addrspace(1)* %62, align 4, !tbaa !7
  %63 = shl i32 %24, 1
  %64 = add i32 %63, 10
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %65
  store i32 0, i32 addrspace(1)* %66, align 4, !tbaa !7
  %67 = add i32 %63, 11
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %68
  store i32 0, i32 addrspace(1)* %69, align 4, !tbaa !7
  %70 = shl i32 %24, 1
  %71 = add i32 %70, 12
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %72
  store i32 0, i32 addrspace(1)* %73, align 4, !tbaa !7
  %74 = add i32 %70, 13
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %75
  store i32 0, i32 addrspace(1)* %76, align 4, !tbaa !7
  %77 = shl i32 %24, 1
  %78 = add i32 %77, 14
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %79
  store i32 0, i32 addrspace(1)* %80, align 4, !tbaa !7
  %81 = add i32 %77, 15
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %82
  store i32 0, i32 addrspace(1)* %83, align 4, !tbaa !7
  br label %84

84:                                               ; preds = %23, %15, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
