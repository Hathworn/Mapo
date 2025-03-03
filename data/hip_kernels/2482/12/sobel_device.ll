; ModuleID = '../data/hip_kernels/2482/12/main.cu'
source_filename = "../data/hip_kernels/2482/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ5sobeliiiPjPiE10sharedTile = internal unnamed_addr addrspace(3) global [1024 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z5sobeliiiPjPi(i32 %0, i32 %1, i32 %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 2, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %22 = add i32 %20, %21
  %23 = shl nuw nsw i32 %13, 5
  %24 = add nuw nsw i32 %23, %21
  %25 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ5sobeliiiPjPiE10sharedTile, i32 0, i32 %24
  store i32 0, i32 addrspace(3)* %25, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %26 = mul nsw i32 %14, %0
  %27 = add nsw i32 %26, %22
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %28
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !5
  store i32 %30, i32 addrspace(3)* %25, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = icmp slt i32 %14, %1
  %32 = icmp slt i32 %22, %0
  %33 = select i1 %31, i1 %32, i1 false
  br i1 %33, label %34, label %36

34:                                               ; preds = %5
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %28
  store i32 0, i32 addrspace(1)* %35, align 4, !tbaa !7
  br label %36

36:                                               ; preds = %34, %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %37 = icmp sgt i32 %14, 0
  %38 = icmp sgt i32 %22, 0
  %39 = select i1 %37, i1 %38, i1 false
  %40 = add nsw i32 %1, -1
  %41 = icmp slt i32 %14, %40
  %42 = select i1 %39, i1 %41, i1 false
  %43 = add nsw i32 %0, -1
  %44 = icmp slt i32 %22, %43
  %45 = select i1 %42, i1 %44, i1 false
  br i1 %45, label %46, label %162

46:                                               ; preds = %36
  %47 = icmp eq i32 %13, 0
  br i1 %47, label %97, label %48

48:                                               ; preds = %46
  %49 = icmp ult i32 %13, 31
  %50 = icmp ne i32 %21, 0
  %51 = select i1 %49, i1 %50, i1 false
  %52 = icmp ult i32 %21, 31
  %53 = select i1 %51, i1 %52, i1 false
  br i1 %53, label %54, label %97

54:                                               ; preds = %48
  %55 = add nsw i32 %24, -32
  %56 = add nsw i32 %24, -31
  %57 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ5sobeliiiPjPiE10sharedTile, i32 0, i32 %56
  %58 = load i32, i32 addrspace(3)* %57, align 4, !tbaa !7
  %59 = add nsw i32 %24, -33
  %60 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ5sobeliiiPjPiE10sharedTile, i32 0, i32 %59
  %61 = load i32, i32 addrspace(3)* %60, align 4, !tbaa !7
  %62 = add nuw nsw i32 %24, 1
  %63 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ5sobeliiiPjPiE10sharedTile, i32 0, i32 %62
  %64 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !7
  %65 = add nsw i32 %24, -1
  %66 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ5sobeliiiPjPiE10sharedTile, i32 0, i32 %65
  %67 = load i32, i32 addrspace(3)* %66, align 4, !tbaa !7
  %68 = add nuw nsw i32 %24, 32
  %69 = add nuw nsw i32 %24, 33
  %70 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ5sobeliiiPjPiE10sharedTile, i32 0, i32 %69
  %71 = load i32, i32 addrspace(3)* %70, align 4, !tbaa !7
  %72 = add nuw nsw i32 %24, 31
  %73 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ5sobeliiiPjPiE10sharedTile, i32 0, i32 %72
  %74 = load i32, i32 addrspace(3)* %73, align 4, !tbaa !7
  %75 = sub i32 %64, %67
  %76 = shl i32 %75, 1
  %77 = add i32 %58, %71
  %78 = add i32 %61, %74
  %79 = sub i32 %77, %78
  %80 = add i32 %79, %76
  %81 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ5sobeliiiPjPiE10sharedTile, i32 0, i32 %55
  %82 = load i32, i32 addrspace(3)* %81, align 4, !tbaa !7
  %83 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ5sobeliiiPjPiE10sharedTile, i32 0, i32 %68
  %84 = load i32, i32 addrspace(3)* %83, align 4, !tbaa !7
  %85 = sub i32 %82, %84
  %86 = shl i32 %85, 1
  %87 = add i32 %61, %58
  %88 = add i32 %71, %74
  %89 = sub i32 %87, %88
  %90 = add i32 %89, %86
  %91 = mul nsw i32 %80, %80
  %92 = mul nsw i32 %90, %90
  %93 = add nuw nsw i32 %92, %91
  %94 = icmp sgt i32 %93, %2
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %28
  %96 = select i1 %94, i32 255, i32 0
  store i32 %96, i32 addrspace(1)* %95, align 4, !tbaa !7
  br label %97

97:                                               ; preds = %54, %48, %46
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %98 = add nsw i32 %11, -1
  %99 = icmp eq i32 %13, %98
  br i1 %99, label %106, label %100

100:                                              ; preds = %97
  %101 = add nsw i32 %19, -1
  %102 = icmp eq i32 %21, %101
  %103 = select i1 %102, i1 true, i1 %47
  %104 = icmp eq i32 %21, 0
  %105 = or i1 %103, %104
  br i1 %105, label %106, label %161

106:                                              ; preds = %100, %97
  %107 = add nsw i32 %14, -1
  %108 = mul nsw i32 %107, %0
  %109 = add nsw i32 %108, %22
  %110 = add nsw i32 %109, 1
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %111
  %113 = load i32, i32 addrspace(1)* %112, align 4, !tbaa !7
  %114 = add nsw i32 %109, -1
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %115
  %117 = load i32, i32 addrspace(1)* %116, align 4, !tbaa !7
  %118 = add nsw i32 %27, 1
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %119
  %121 = load i32, i32 addrspace(1)* %120, align 4, !tbaa !7
  %122 = add nsw i32 %27, -1
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %123
  %125 = load i32, i32 addrspace(1)* %124, align 4, !tbaa !7
  %126 = add nuw nsw i32 %14, 1
  %127 = mul nsw i32 %126, %0
  %128 = add nsw i32 %127, %22
  %129 = add nsw i32 %128, 1
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %130
  %132 = load i32, i32 addrspace(1)* %131, align 4, !tbaa !7
  %133 = add nsw i32 %128, -1
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %134
  %136 = load i32, i32 addrspace(1)* %135, align 4, !tbaa !7
  %137 = sub i32 %121, %125
  %138 = shl i32 %137, 1
  %139 = add i32 %113, %132
  %140 = add i32 %117, %136
  %141 = sub i32 %139, %140
  %142 = add i32 %141, %138
  %143 = sext i32 %109 to i64
  %144 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %143
  %145 = load i32, i32 addrspace(1)* %144, align 4, !tbaa !7
  %146 = sext i32 %128 to i64
  %147 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %146
  %148 = load i32, i32 addrspace(1)* %147, align 4, !tbaa !7
  %149 = sub i32 %145, %148
  %150 = shl i32 %149, 1
  %151 = add i32 %117, %113
  %152 = add i32 %132, %136
  %153 = sub i32 %151, %152
  %154 = add i32 %153, %150
  %155 = mul nsw i32 %142, %142
  %156 = mul nsw i32 %154, %154
  %157 = add nuw nsw i32 %156, %155
  %158 = icmp sgt i32 %157, %2
  %159 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %28
  %160 = select i1 %158, i32 255, i32 0
  store i32 %160, i32 addrspace(1)* %159, align 4, !tbaa !7
  br label %161

161:                                              ; preds = %106, %100
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %162

162:                                              ; preds = %161, %36
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
