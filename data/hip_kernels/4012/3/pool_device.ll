; ModuleID = '../data/hip_kernels/4012/3/main.cu'
source_filename = "../data/hip_kernels/4012/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z4poolPhS_jji(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = shl i32 %14, 2
  %16 = mul i32 %3, %2
  %17 = icmp ult i32 %15, %16
  br i1 %17, label %18, label %23

18:                                               ; preds = %5
  %19 = shl i32 %3, 1
  %20 = shl i32 %3, 3
  %21 = shl i32 %3, 2
  %22 = shl nsw i32 %4, 2
  br label %24

23:                                               ; preds = %24, %5
  ret void

24:                                               ; preds = %18, %24
  %25 = phi i32 [ %15, %18 ], [ %120, %24 ]
  %26 = freeze i32 %25
  %27 = freeze i32 %19
  %28 = udiv i32 %26, %27
  %29 = mul i32 %28, %27
  %30 = sub i32 %26, %29
  %31 = shl i32 %30, 1
  %32 = mul i32 %20, %28
  %33 = add i32 %32, %31
  %34 = add i32 %33, 4
  %35 = add i32 %33, %21
  %36 = add i32 %35, 4
  %37 = sext i32 %33 to i64
  %38 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %37
  %39 = load i8, i8 addrspace(1)* %38, align 1, !tbaa !7
  %40 = sext i32 %34 to i64
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %40
  %42 = load i8, i8 addrspace(1)* %41, align 1, !tbaa !7
  %43 = sext i32 %35 to i64
  %44 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %43
  %45 = load i8, i8 addrspace(1)* %44, align 1, !tbaa !7
  %46 = sext i32 %36 to i64
  %47 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %46
  %48 = load i8, i8 addrspace(1)* %47, align 1, !tbaa !7
  %49 = or i32 %33, 1
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %50
  %52 = load i8, i8 addrspace(1)* %51, align 1, !tbaa !7
  %53 = add i32 %33, 5
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %54
  %56 = load i8, i8 addrspace(1)* %55, align 1, !tbaa !7
  %57 = or i32 %35, 1
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %58
  %60 = load i8, i8 addrspace(1)* %59, align 1, !tbaa !7
  %61 = add i32 %35, 5
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %62
  %64 = load i8, i8 addrspace(1)* %63, align 1, !tbaa !7
  %65 = add nsw i32 %33, 2
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %66
  %68 = load i8, i8 addrspace(1)* %67, align 1, !tbaa !7
  %69 = add i32 %33, 6
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %70
  %72 = load i8, i8 addrspace(1)* %71, align 1, !tbaa !7
  %73 = add nsw i32 %35, 2
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %74
  %76 = load i8, i8 addrspace(1)* %75, align 1, !tbaa !7
  %77 = add i32 %35, 6
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %78
  %80 = load i8, i8 addrspace(1)* %79, align 1, !tbaa !7
  %81 = add nsw i32 %33, 3
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %82
  %84 = load i8, i8 addrspace(1)* %83, align 1, !tbaa !7
  %85 = add i32 %33, 7
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %86
  %88 = load i8, i8 addrspace(1)* %87, align 1, !tbaa !7
  %89 = add nsw i32 %35, 3
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %90
  %92 = load i8, i8 addrspace(1)* %91, align 1, !tbaa !7
  %93 = add i32 %35, 7
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %94
  %96 = load i8, i8 addrspace(1)* %95, align 1, !tbaa !7
  %97 = tail call i8 @llvm.umax.i8(i8 %42, i8 %39)
  %98 = tail call i8 @llvm.umax.i8(i8 %56, i8 %52)
  %99 = tail call i8 @llvm.umax.i8(i8 %72, i8 %68)
  %100 = tail call i8 @llvm.umax.i8(i8 %88, i8 %84)
  %101 = tail call i8 @llvm.umax.i8(i8 %45, i8 %97)
  %102 = tail call i8 @llvm.umax.i8(i8 %60, i8 %98)
  %103 = tail call i8 @llvm.umax.i8(i8 %76, i8 %99)
  %104 = tail call i8 @llvm.umax.i8(i8 %92, i8 %100)
  %105 = tail call i8 @llvm.umax.i8(i8 %48, i8 %101)
  %106 = tail call i8 @llvm.umax.i8(i8 %64, i8 %102)
  %107 = tail call i8 @llvm.umax.i8(i8 %80, i8 %103)
  %108 = tail call i8 @llvm.umax.i8(i8 %96, i8 %104)
  %109 = sext i32 %25 to i64
  %110 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %109
  store i8 %105, i8 addrspace(1)* %110, align 1, !tbaa !7
  %111 = or i32 %25, 1
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %112
  store i8 %106, i8 addrspace(1)* %113, align 1, !tbaa !7
  %114 = or i32 %25, 2
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %115
  store i8 %107, i8 addrspace(1)* %116, align 1, !tbaa !7
  %117 = or i32 %25, 3
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %118
  store i8 %108, i8 addrspace(1)* %119, align 1, !tbaa !7
  %120 = add nsw i32 %25, %22
  %121 = icmp ult i32 %120, %16
  br i1 %121, label %24, label %23, !llvm.loop !10
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i8 @llvm.umax.i8(i8, i8) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
