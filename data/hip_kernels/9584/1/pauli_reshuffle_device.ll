; ModuleID = '../data/hip_kernels/9584/1/main.cu'
source_filename = "../data/hip_kernels/9584/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15pauli_reshufflePdS_jj(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = shl nuw i32 1, %2
  %23 = icmp slt i32 %13, %22
  %24 = icmp slt i32 %21, %22
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %153

26:                                               ; preds = %4
  %27 = xor i32 %13, -1
  %28 = and i32 %21, %27
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %37, label %30

30:                                               ; preds = %26, %30
  %31 = phi i32 [ %34, %30 ], [ 0, %26 ]
  %32 = phi i32 [ %35, %30 ], [ %28, %26 ]
  %33 = and i32 %32, 1
  %34 = add i32 %31, %33
  %35 = lshr i32 %32, 1
  %36 = icmp ult i32 %32, 2
  br i1 %36, label %37, label %30, !llvm.loop !7

37:                                               ; preds = %30, %26
  %38 = phi i32 [ 0, %26 ], [ %34, %30 ]
  %39 = shl i32 %13, %2
  %40 = or i32 %39, %21
  %41 = and i32 %38, 1
  %42 = and i32 %13, 1
  %43 = shl i32 %21, 1
  %44 = and i32 %43, 2
  %45 = or i32 %44, %42
  %46 = shl i32 %13, 1
  %47 = and i32 %46, 4
  %48 = shl i32 %21, 2
  %49 = and i32 %48, 8
  %50 = or i32 %49, %45
  %51 = or i32 %50, %47
  %52 = shl i32 %13, 2
  %53 = and i32 %52, 16
  %54 = shl i32 %21, 3
  %55 = and i32 %54, 32
  %56 = or i32 %55, %51
  %57 = or i32 %56, %53
  %58 = shl i32 %13, 3
  %59 = and i32 %58, 64
  %60 = shl i32 %21, 4
  %61 = and i32 %60, 128
  %62 = or i32 %61, %57
  %63 = or i32 %62, %59
  %64 = shl i32 %13, 4
  %65 = and i32 %64, 256
  %66 = shl i32 %21, 5
  %67 = and i32 %66, 512
  %68 = or i32 %67, %63
  %69 = or i32 %68, %65
  %70 = shl i32 %13, 5
  %71 = and i32 %70, 1024
  %72 = shl i32 %21, 6
  %73 = and i32 %72, 2048
  %74 = or i32 %73, %69
  %75 = or i32 %74, %71
  %76 = shl i32 %13, 6
  %77 = and i32 %76, 4096
  %78 = shl i32 %21, 7
  %79 = and i32 %78, 8192
  %80 = or i32 %79, %75
  %81 = or i32 %80, %77
  %82 = shl i32 %13, 7
  %83 = and i32 %82, 16384
  %84 = shl i32 %21, 8
  %85 = and i32 %84, 32768
  %86 = or i32 %85, %81
  %87 = or i32 %86, %83
  %88 = shl i32 %13, 8
  %89 = and i32 %88, 65536
  %90 = shl i32 %21, 9
  %91 = and i32 %90, 131072
  %92 = or i32 %91, %87
  %93 = or i32 %92, %89
  %94 = shl i32 %13, 9
  %95 = and i32 %94, 262144
  %96 = shl i32 %21, 10
  %97 = and i32 %96, 524288
  %98 = or i32 %97, %93
  %99 = or i32 %98, %95
  %100 = shl i32 %13, 10
  %101 = and i32 %100, 1048576
  %102 = shl i32 %21, 11
  %103 = and i32 %102, 2097152
  %104 = or i32 %103, %99
  %105 = or i32 %104, %101
  %106 = shl i32 %13, 11
  %107 = and i32 %106, 4194304
  %108 = shl i32 %21, 12
  %109 = and i32 %108, 8388608
  %110 = or i32 %109, %105
  %111 = or i32 %110, %107
  %112 = shl i32 %13, 12
  %113 = and i32 %112, 16777216
  %114 = shl i32 %21, 13
  %115 = and i32 %114, 33554432
  %116 = or i32 %115, %111
  %117 = or i32 %116, %113
  %118 = shl i32 %13, 13
  %119 = and i32 %118, 67108864
  %120 = shl i32 %21, 14
  %121 = and i32 %120, 134217728
  %122 = or i32 %121, %117
  %123 = or i32 %122, %119
  %124 = shl i32 %13, 14
  %125 = and i32 %124, 268435456
  %126 = shl i32 %21, 15
  %127 = and i32 %126, 536870912
  %128 = or i32 %127, %123
  %129 = or i32 %128, %125
  %130 = shl i32 %13, 15
  %131 = and i32 %130, 1073741824
  %132 = shl i32 %21, 16
  %133 = and i32 %132, -2147483648
  %134 = or i32 %133, %129
  %135 = or i32 %134, %131
  %136 = and i32 %38, 2
  %137 = shl i32 %40, 1
  %138 = or i32 %41, %137
  %139 = icmp eq i32 %3, 0
  %140 = icmp eq i32 %136, 0
  %141 = select i1 %140, i32 1, i32 -1
  %142 = sitofp i32 %141 to double
  %143 = select i1 %139, i32 %138, i32 %135
  %144 = select i1 %139, double addrspace(1)* %0, double addrspace(1)* %1
  %145 = select i1 %139, i32 %135, i32 %138
  %146 = select i1 %139, double addrspace(1)* %1, double addrspace(1)* %0
  %147 = zext i32 %143 to i64
  %148 = getelementptr inbounds double, double addrspace(1)* %144, i64 %147
  %149 = load double, double addrspace(1)* %148, align 8, !tbaa !9
  %150 = fmul contract double %149, %142
  %151 = zext i32 %145 to i64
  %152 = getelementptr inbounds double, double addrspace(1)* %146, i64 %151
  store double %150, double addrspace(1)* %152, align 8, !tbaa !9
  br label %153

153:                                              ; preds = %37, %4
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
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"double", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
