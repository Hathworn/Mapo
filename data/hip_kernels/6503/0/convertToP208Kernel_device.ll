; ModuleID = '../data/hip_kernels/6503/0/main.cu'
source_filename = "../data/hip_kernels/6503/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL19convertToP208KernelPtS_iii = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define amdgpu_kernel void @_ZL19convertToP208KernelPtS_iii(i16 addrspace(1)* nocapture readonly %0, i16 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 comdat {
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
  %23 = sdiv i32 %2, 8
  %24 = icmp slt i32 %14, %23
  %25 = icmp slt i32 %22, %4
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %147

27:                                               ; preds = %5
  %28 = shl nsw i32 %14, 3
  %29 = mul nsw i32 %22, %2
  %30 = add nsw i32 %29, %28
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %31
  %33 = load i16, i16 addrspace(1)* %32, align 2, !tbaa !7, !amdgpu.noclobber !5
  %34 = zext i16 %33 to i32
  %35 = add nsw i32 %30, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %36
  %38 = load i16, i16 addrspace(1)* %37, align 2, !tbaa !7, !amdgpu.noclobber !5
  %39 = zext i16 %38 to i32
  %40 = shl nuw i32 %39, 16
  %41 = or i32 %40, %34
  %42 = add nsw i32 %30, 2
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %43
  %45 = load i16, i16 addrspace(1)* %44, align 2, !tbaa !7, !amdgpu.noclobber !5
  %46 = zext i16 %45 to i32
  %47 = add nsw i32 %30, 3
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %48
  %50 = load i16, i16 addrspace(1)* %49, align 2, !tbaa !7, !amdgpu.noclobber !5
  %51 = zext i16 %50 to i32
  %52 = shl nuw i32 %51, 16
  %53 = or i32 %52, %46
  %54 = add nsw i32 %30, 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %55
  %57 = load i16, i16 addrspace(1)* %56, align 2, !tbaa !7, !amdgpu.noclobber !5
  %58 = zext i16 %57 to i32
  %59 = add nsw i32 %30, 5
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %60
  %62 = load i16, i16 addrspace(1)* %61, align 2, !tbaa !7, !amdgpu.noclobber !5
  %63 = zext i16 %62 to i32
  %64 = shl nuw i32 %63, 16
  %65 = or i32 %64, %58
  %66 = add nsw i32 %30, 6
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %67
  %69 = load i16, i16 addrspace(1)* %68, align 2, !tbaa !7, !amdgpu.noclobber !5
  %70 = zext i16 %69 to i32
  %71 = add nsw i32 %30, 7
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %72
  %74 = load i16, i16 addrspace(1)* %73, align 2, !tbaa !7, !amdgpu.noclobber !5
  %75 = zext i16 %74 to i32
  %76 = shl nuw i32 %75, 16
  %77 = or i32 %76, %70
  %78 = lshr i16 %38, 4
  %79 = and i16 %78, 1023
  %80 = lshr i32 %41, 10
  %81 = and i16 %33, 1023
  %82 = lshr i16 %50, 4
  %83 = and i16 %82, 1023
  %84 = lshr i32 %53, 10
  %85 = and i16 %45, 1023
  %86 = lshr i16 %62, 4
  %87 = and i16 %86, 1023
  %88 = lshr i32 %65, 10
  %89 = and i16 %57, 1023
  %90 = lshr i16 %74, 4
  %91 = and i16 %90, 1023
  %92 = lshr i32 %77, 10
  %93 = and i16 %69, 1023
  %94 = mul nsw i32 %14, 6
  %95 = mul nsw i32 %29, 3
  %96 = sdiv i32 %95, 4
  %97 = trunc i32 %80 to i16
  %98 = and i16 %97, 1023
  %99 = add nsw i32 %96, %94
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %100
  store i16 %98, i16 addrspace(1)* %101, align 2, !tbaa !7
  %102 = add nsw i32 %99, 1
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %103
  store i16 %85, i16 addrspace(1)* %104, align 2, !tbaa !7
  %105 = add nsw i32 %99, 2
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %106
  store i16 %83, i16 addrspace(1)* %107, align 2, !tbaa !7
  %108 = trunc i32 %88 to i16
  %109 = and i16 %108, 1023
  %110 = add nsw i32 %99, 3
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %111
  store i16 %109, i16 addrspace(1)* %112, align 2, !tbaa !7
  %113 = add nsw i32 %99, 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %114
  store i16 %93, i16 addrspace(1)* %115, align 2, !tbaa !7
  %116 = add nsw i32 %99, 5
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %117
  store i16 %91, i16 addrspace(1)* %118, align 2, !tbaa !7
  %119 = mul nsw i32 %14, 3
  %120 = sdiv i32 %95, 8
  %121 = mul nsw i32 %4, %3
  %122 = add i32 %120, %119
  %123 = add i32 %122, %121
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %124
  store i16 %81, i16 addrspace(1)* %125, align 2, !tbaa !7
  %126 = trunc i32 %84 to i16
  %127 = and i16 %126, 1023
  %128 = add nsw i32 %123, 1
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %129
  store i16 %127, i16 addrspace(1)* %130, align 2, !tbaa !7
  %131 = add nsw i32 %123, 2
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %132
  store i16 %87, i16 addrspace(1)* %133, align 2, !tbaa !7
  %134 = mul nsw i32 %121, 3
  %135 = sdiv i32 %134, 2
  %136 = add i32 %122, %135
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %137
  store i16 %79, i16 addrspace(1)* %138, align 2, !tbaa !7
  %139 = add nsw i32 %136, 1
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %140
  store i16 %89, i16 addrspace(1)* %141, align 2, !tbaa !7
  %142 = trunc i32 %92 to i16
  %143 = and i16 %142, 1023
  %144 = add nsw i32 %136, 2
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %145
  store i16 %143, i16 addrspace(1)* %146, align 2, !tbaa !7
  br label %147

147:                                              ; preds = %27, %5
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
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
