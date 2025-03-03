; ModuleID = '../data/hip_kernels/2922/13/main.cu'
source_filename = "../data/hip_kernels/2922/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z4gamePiiii(i32 addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = sdiv i32 %13, %3
  %15 = mul nsw i32 %14, %2
  %16 = sub nsw i32 %13, %15
  %17 = icmp slt i32 %14, %3
  %18 = icmp slt i32 %16, %2
  %19 = select i1 %17, i1 %18, i1 false
  br i1 %19, label %20, label %114

20:                                               ; preds = %4
  %21 = sext i32 %13 to i64
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %21
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = icmp sgt i32 %16, 0
  br i1 %24, label %25, label %30

25:                                               ; preds = %20
  %26 = add nsw i32 %13, -1
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %30

30:                                               ; preds = %25, %20
  %31 = phi i32 [ %29, %25 ], [ 0, %20 ]
  %32 = add nsw i32 %2, -1
  %33 = icmp sge i32 %16, %32
  br i1 %33, label %39, label %34

34:                                               ; preds = %30
  %35 = add nsw i32 %13, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %39

39:                                               ; preds = %34, %30
  %40 = phi i32 [ %38, %34 ], [ 0, %30 ]
  %41 = icmp sgt i32 %14, 0
  br i1 %41, label %42, label %47

42:                                               ; preds = %39
  %43 = sub nsw i32 %13, %2
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %47

47:                                               ; preds = %42, %39
  %48 = phi i32 [ %46, %42 ], [ 0, %39 ]
  %49 = add nsw i32 %3, -1
  %50 = icmp slt i32 %14, %49
  br i1 %50, label %51, label %56

51:                                               ; preds = %47
  %52 = add nsw i32 %13, %2
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %56

56:                                               ; preds = %51, %47
  %57 = phi i1 [ %24, %51 ], [ false, %47 ]
  %58 = phi i1 [ %33, %51 ], [ true, %47 ]
  %59 = phi i32 [ %55, %51 ], [ 0, %47 ]
  br i1 %58, label %66, label %60

60:                                               ; preds = %56
  %61 = add nsw i32 %13, %2
  %62 = add nsw i32 %61, 1
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %63
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %66

66:                                               ; preds = %56, %60
  %67 = phi i1 [ %24, %60 ], [ %57, %56 ]
  %68 = phi i32 [ %65, %60 ], [ 0, %56 ]
  br i1 %67, label %69, label %75

69:                                               ; preds = %66
  %70 = add nsw i32 %13, %2
  %71 = add nsw i32 %70, -1
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %72
  %74 = load i32, i32 addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %75

75:                                               ; preds = %69, %66
  %76 = phi i32 [ %74, %69 ], [ 0, %66 ]
  %77 = select i1 %41, i1 %24, i1 false
  br i1 %77, label %78, label %84

78:                                               ; preds = %75
  %79 = sub i32 %13, %2
  %80 = add nsw i32 %79, -1
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %84

84:                                               ; preds = %78, %75
  %85 = phi i32 [ %83, %78 ], [ 0, %75 ]
  %86 = xor i1 %41, true
  %87 = select i1 %86, i1 true, i1 %33
  br i1 %87, label %94, label %88

88:                                               ; preds = %84
  %89 = sub i32 %13, %2
  %90 = add i32 %89, 1
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %91
  %93 = load i32, i32 addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %94

94:                                               ; preds = %84, %88
  %95 = phi i32 [ %93, %88 ], [ 0, %84 ]
  %96 = add i32 %40, %31
  %97 = add i32 %96, %48
  %98 = add i32 %97, %59
  %99 = add i32 %98, %68
  %100 = add i32 %99, %76
  %101 = add i32 %100, %85
  %102 = add i32 %101, %95
  %103 = icmp eq i32 %23, 1
  %104 = icmp slt i32 %102, 2
  %105 = select i1 %103, i1 %104, i1 false
  %106 = icmp sgt i32 %102, 3
  %107 = select i1 %105, i1 true, i1 %106
  br i1 %107, label %112, label %108

108:                                              ; preds = %94
  %109 = icmp eq i32 %23, 0
  %110 = icmp eq i32 %102, 3
  %111 = select i1 %109, i1 %110, i1 false
  br i1 %111, label %112, label %114

112:                                              ; preds = %108, %94
  %113 = phi i32 [ 0, %94 ], [ 1, %108 ]
  store i32 %113, i32 addrspace(1)* %22, align 4, !tbaa !7
  br label %114

114:                                              ; preds = %112, %108, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
