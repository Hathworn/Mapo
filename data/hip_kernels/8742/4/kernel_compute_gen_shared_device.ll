; ModuleID = '../data/hip_kernels/8742/4/main.cu'
source_filename = "../data/hip_kernels/8742/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@shared = external hidden local_unnamed_addr addrspace(3) global [0 x i8], align 1

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z25kernel_compute_gen_sharedPhS_jj(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = add i32 %3, -1
  %15 = and i32 %13, %14
  %16 = add i32 %15, -1
  %17 = and i32 %16, %14
  %18 = add i32 %15, 1
  %19 = and i32 %18, %14
  %20 = sub i32 %13, %15
  %21 = sub i32 %20, %3
  %22 = and i32 %21, %2
  %23 = add i32 %20, %3
  %24 = and i32 %23, %2
  %25 = add i32 %22, %15
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %26
  %28 = load i8, i8 addrspace(1)* %27, align 1, !tbaa !7, !amdgpu.noclobber !5
  %29 = add nuw nsw i32 %12, 1
  %30 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @shared, i32 0, i32 %29
  store i8 %28, i8 addrspace(3)* %30, align 1, !tbaa !7
  %31 = zext i32 %13 to i64
  %32 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %31
  %33 = load i8, i8 addrspace(1)* %32, align 1, !tbaa !7, !amdgpu.noclobber !5
  %34 = add nuw nsw i32 %29, %10
  %35 = add nuw nsw i32 %34, 2
  %36 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @shared, i32 0, i32 %35
  store i8 %33, i8 addrspace(3)* %36, align 1, !tbaa !7
  %37 = add i32 %24, %15
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %38
  %40 = load i8, i8 addrspace(1)* %39, align 1, !tbaa !7, !amdgpu.noclobber !5
  %41 = shl nuw nsw i32 %10, 1
  %42 = add nuw nsw i32 %12, 5
  %43 = add nuw nsw i32 %42, %41
  %44 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @shared, i32 0, i32 %43
  store i8 %40, i8 addrspace(3)* %44, align 1, !tbaa !7
  %45 = icmp eq i32 %12, 0
  br i1 %45, label %46, label %58

46:                                               ; preds = %4
  %47 = add i32 %22, %17
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %48
  %50 = load i8, i8 addrspace(1)* %49, align 1, !tbaa !7, !amdgpu.noclobber !5
  store i8 %50, i8 addrspace(3)* getelementptr inbounds ([0 x i8], [0 x i8] addrspace(3)* @shared, i32 0, i32 0), align 1, !tbaa !7
  %51 = add i32 %17, %20
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %52
  %54 = load i8, i8 addrspace(1)* %53, align 1, !tbaa !7, !amdgpu.noclobber !5
  %55 = add nuw nsw i32 %10, 2
  %56 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @shared, i32 0, i32 %55
  store i8 %54, i8 addrspace(3)* %56, align 1, !tbaa !7
  %57 = add nuw nsw i32 %41, 4
  br label %76

58:                                               ; preds = %4
  %59 = add nsw i32 %10, -1
  %60 = icmp eq i32 %12, %59
  br i1 %60, label %61, label %84

61:                                               ; preds = %58
  %62 = add i32 %22, %19
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %63
  %65 = load i8, i8 addrspace(1)* %64, align 1, !tbaa !7, !amdgpu.noclobber !5
  %66 = add nuw nsw i32 %10, 1
  %67 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @shared, i32 0, i32 %66
  store i8 %65, i8 addrspace(3)* %67, align 1, !tbaa !7
  %68 = add i32 %19, %20
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %69
  %71 = load i8, i8 addrspace(1)* %70, align 1, !tbaa !7, !amdgpu.noclobber !5
  %72 = add nuw nsw i32 %41, 3
  %73 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @shared, i32 0, i32 %72
  store i8 %71, i8 addrspace(3)* %73, align 1, !tbaa !7
  %74 = mul nuw nsw i32 %10, 3
  %75 = add nuw nsw i32 %74, 5
  br label %76

76:                                               ; preds = %46, %61
  %77 = phi i32 [ %75, %61 ], [ %57, %46 ]
  %78 = phi i32 [ %19, %61 ], [ %17, %46 ]
  %79 = add i32 %24, %78
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %80
  %82 = load i8, i8 addrspace(1)* %81, align 1, !tbaa !7
  %83 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @shared, i32 0, i32 %77
  store i8 %82, i8 addrspace(3)* %83, align 1, !tbaa !7
  br label %84

84:                                               ; preds = %76, %58
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %85 = add nuw nsw i32 %34, 1
  %86 = add nuw nsw i32 %34, 3
  %87 = sub nuw nsw i32 -2, %10
  %88 = add nuw nsw i32 %10, 2
  %89 = add nsw i32 %85, %87
  %90 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @shared, i32 0, i32 %89
  %91 = load i8, i8 addrspace(3)* %90, align 1, !tbaa !7
  %92 = add nsw i32 %35, %87
  %93 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @shared, i32 0, i32 %92
  %94 = load i8, i8 addrspace(3)* %93, align 1, !tbaa !7
  %95 = add i8 %94, %91
  %96 = add nsw i32 %86, %87
  %97 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @shared, i32 0, i32 %96
  %98 = load i8, i8 addrspace(3)* %97, align 1, !tbaa !7
  %99 = add i8 %95, %98
  %100 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @shared, i32 0, i32 %85
  %101 = load i8, i8 addrspace(3)* %100, align 1, !tbaa !7
  %102 = add i8 %99, %101
  %103 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @shared, i32 0, i32 %86
  %104 = load i8, i8 addrspace(3)* %103, align 1, !tbaa !7
  %105 = add i8 %102, %104
  %106 = add nuw nsw i32 %85, %88
  %107 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @shared, i32 0, i32 %106
  %108 = load i8, i8 addrspace(3)* %107, align 1, !tbaa !7
  %109 = add i8 %105, %108
  %110 = add nuw nsw i32 %35, %88
  %111 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @shared, i32 0, i32 %110
  %112 = load i8, i8 addrspace(3)* %111, align 1, !tbaa !7
  %113 = add i8 %109, %112
  %114 = add nuw nsw i32 %86, %88
  %115 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @shared, i32 0, i32 %114
  %116 = load i8, i8 addrspace(3)* %115, align 1, !tbaa !7
  %117 = add i8 %113, %116
  switch i8 %117, label %121 [
    i8 3, label %122
    i8 2, label %118
  ]

118:                                              ; preds = %84
  %119 = load i8, i8 addrspace(3)* %36, align 1, !tbaa !7
  %120 = icmp ne i8 %119, 0
  br label %122

121:                                              ; preds = %84
  br label %122

122:                                              ; preds = %84, %121, %118
  %123 = phi i1 [ true, %84 ], [ %120, %118 ], [ false, %121 ]
  %124 = zext i1 %123 to i8
  %125 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %31
  store i8 %124, i8 addrspace(1)* %125, align 1, !tbaa !7
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
