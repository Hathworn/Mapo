; ModuleID = '../data/hip_kernels/8192/111/main.cu'
source_filename = "../data/hip_kernels/8192/111/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13implantCoeffsPfS_ii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 2, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 8
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %5, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !6
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = add i32 %19, %20
  %24 = mul i32 %23, %14
  %25 = add i32 %24, %21
  %26 = mul i32 %25, %10
  %27 = add i32 %26, %22
  %28 = mul i32 %3, %3
  %29 = mul i32 %28, %27
  %30 = mul nsw i32 %27, %2
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %1, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = sext i32 %29 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  store float %33, float addrspace(1)* %35, align 4, !tbaa !7
  %36 = icmp sgt i32 %2, 1
  br i1 %36, label %37, label %130

37:                                               ; preds = %4
  %38 = add nsw i32 %2, -1
  %39 = add nsw i32 %3, -1
  %40 = add i32 %30, %2
  br label %41

41:                                               ; preds = %37, %123
  %42 = phi i32 [ 1, %37 ], [ %128, %123 ]
  %43 = phi i32 [ 0, %37 ], [ %127, %123 ]
  %44 = phi i32 [ %38, %37 ], [ %124, %123 ]
  %45 = icmp slt i32 %42, %39
  %46 = add nsw i32 %42, 1
  %47 = sub i32 %42, %43
  %48 = add i32 %47, 1
  %49 = select i1 %45, i32 %46, i32 %48
  %50 = and i32 %49, 1
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %55, label %52

52:                                               ; preds = %41
  %53 = sub nsw i32 0, %44
  %54 = icmp sgt i32 %49, 1
  br i1 %54, label %79, label %106

55:                                               ; preds = %41
  %56 = icmp sgt i32 %49, 0
  br i1 %56, label %57, label %123

57:                                               ; preds = %55, %57
  %58 = phi i32 [ %71, %57 ], [ %49, %55 ]
  %59 = phi i32 [ %75, %57 ], [ %43, %55 ]
  %60 = phi i32 [ %74, %57 ], [ %42, %55 ]
  %61 = phi i32 [ %72, %57 ], [ %44, %55 ]
  %62 = sub i32 %40, %61
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %1, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7
  %66 = add nsw i32 %60, %29
  %67 = mul nsw i32 %59, %3
  %68 = add nsw i32 %66, %67
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  store float %65, float addrspace(1)* %70, align 4, !tbaa !7
  %71 = add nsw i32 %58, -1
  %72 = add nsw i32 %61, -1
  %73 = and i32 %58, 1
  %74 = sub i32 %59, %73
  %75 = add nsw i32 %73, %60
  %76 = icmp ugt i32 %58, 1
  %77 = icmp ne i32 %72, 0
  %78 = select i1 %76, i1 %77, i1 false
  br i1 %78, label %57, label %123, !llvm.loop !11

79:                                               ; preds = %52, %79
  %80 = phi i32 [ %102, %79 ], [ %53, %52 ]
  %81 = phi i32 [ %94, %79 ], [ %49, %52 ]
  %82 = phi i32 [ %101, %79 ], [ %43, %52 ]
  %83 = phi i32 [ %99, %79 ], [ %42, %52 ]
  %84 = phi i32 [ %95, %79 ], [ %44, %52 ]
  %85 = add i32 %40, %80
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7
  %89 = add nsw i32 %83, %29
  %90 = mul nsw i32 %82, %3
  %91 = add nsw i32 %89, %90
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  store float %88, float addrspace(1)* %93, align 4, !tbaa !7
  %94 = add nsw i32 %81, -1
  %95 = add nsw i32 %84, -1
  %96 = and i32 %81, -2147483647
  %97 = icmp ne i32 %96, 1
  %98 = sext i1 %97 to i32
  %99 = add nsw i32 %82, %98
  %100 = zext i1 %97 to i32
  %101 = add nsw i32 %83, %100
  %102 = sub i32 1, %84
  %103 = icmp ugt i32 %81, 2
  %104 = icmp ne i32 %95, 0
  %105 = select i1 %103, i1 %104, i1 false
  br i1 %105, label %79, label %106, !llvm.loop !13

106:                                              ; preds = %79, %52
  %107 = phi i32 [ %44, %52 ], [ %95, %79 ]
  %108 = phi i32 [ %42, %52 ], [ %99, %79 ]
  %109 = phi i32 [ %43, %52 ], [ %101, %79 ]
  %110 = phi i32 [ %53, %52 ], [ %102, %79 ]
  %111 = phi i1 [ true, %52 ], [ %104, %79 ]
  br i1 %111, label %112, label %123

112:                                              ; preds = %106
  %113 = add i32 %40, %110
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %1, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7
  %117 = add nsw i32 %108, %29
  %118 = mul nsw i32 %109, %3
  %119 = add nsw i32 %117, %118
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %0, i64 %120
  store float %116, float addrspace(1)* %121, align 4, !tbaa !7
  %122 = add nsw i32 %107, -1
  br label %123

123:                                              ; preds = %57, %55, %106, %112
  %124 = phi i32 [ %122, %112 ], [ 0, %106 ], [ %44, %55 ], [ %72, %57 ]
  %125 = icmp eq i32 %42, %39
  %126 = zext i1 %125 to i32
  %127 = add nuw nsw i32 %43, %126
  %128 = select i1 %125, i32 %42, i32 %46
  %129 = icmp sgt i32 %124, 0
  br i1 %129, label %41, label %130, !llvm.loop !14

130:                                              ; preds = %123, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #1

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
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
