; ModuleID = '../data/hip_kernels/5994/13/main.cu'
source_filename = "../data/hip_kernels/5994/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z25reduceCompleteUnrollWarp8PiS_j(i32 addrspace(1)* %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = shl i32 %5, 3
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %4
  %14 = zext i32 %12 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  %16 = mul nuw nsw i32 %10, 7
  %17 = add i32 %13, %16
  %18 = icmp ult i32 %17, %2
  br i1 %18, label %19, label %62

19:                                               ; preds = %3
  %20 = sext i32 %13 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %20
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !6
  %23 = add i32 %13, %10
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !6
  %27 = shl nuw nsw i32 %10, 1
  %28 = add i32 %13, %27
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !6
  %32 = mul nuw nsw i32 %10, 3
  %33 = add i32 %13, %32
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %34
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !6
  %37 = shl nuw nsw i32 %10, 2
  %38 = add i32 %13, %37
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !6
  %42 = mul nuw nsw i32 %10, 5
  %43 = add i32 %13, %42
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !6
  %47 = mul nuw nsw i32 %10, 6
  %48 = add i32 %13, %47
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %49
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !6
  %52 = zext i32 %17 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %52
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !6
  %55 = add nsw i32 %26, %22
  %56 = add nsw i32 %55, %31
  %57 = add nsw i32 %56, %36
  %58 = add nsw i32 %57, %41
  %59 = add nsw i32 %58, %46
  %60 = add nsw i32 %59, %51
  %61 = add nsw i32 %60, %54
  store i32 %61, i32 addrspace(1)* %21, align 4, !tbaa !7
  br label %62

62:                                               ; preds = %19, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %63 = icmp ugt i16 %9, 1023
  %64 = icmp ult i32 %4, 512
  %65 = select i1 %63, i1 %64, i1 false
  br i1 %65, label %66, label %75

66:                                               ; preds = %62
  %67 = add nuw nsw i32 %4, 512
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !7
  %71 = zext i32 %4 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %71
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !7
  %74 = add nsw i32 %73, %70
  store i32 %74, i32 addrspace(1)* %72, align 4, !tbaa !7
  br label %75

75:                                               ; preds = %66, %62
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %76 = icmp ugt i16 %9, 511
  %77 = icmp ult i32 %4, 256
  %78 = select i1 %76, i1 %77, i1 false
  br i1 %78, label %79, label %88

79:                                               ; preds = %75
  %80 = add nuw nsw i32 %4, 256
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !7
  %84 = zext i32 %4 to i64
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %84
  %86 = load i32, i32 addrspace(1)* %85, align 4, !tbaa !7
  %87 = add nsw i32 %86, %83
  store i32 %87, i32 addrspace(1)* %85, align 4, !tbaa !7
  br label %88

88:                                               ; preds = %79, %75
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %89 = icmp ugt i16 %9, 255
  %90 = icmp ult i32 %4, 128
  %91 = select i1 %89, i1 %90, i1 false
  br i1 %91, label %92, label %101

92:                                               ; preds = %88
  %93 = add nuw nsw i32 %4, 128
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %94
  %96 = load i32, i32 addrspace(1)* %95, align 4, !tbaa !7
  %97 = zext i32 %4 to i64
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %97
  %99 = load i32, i32 addrspace(1)* %98, align 4, !tbaa !7
  %100 = add nsw i32 %99, %96
  store i32 %100, i32 addrspace(1)* %98, align 4, !tbaa !7
  br label %101

101:                                              ; preds = %92, %88
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %102 = icmp ugt i16 %9, 127
  %103 = icmp ult i32 %4, 64
  %104 = select i1 %102, i1 %103, i1 false
  br i1 %104, label %105, label %114

105:                                              ; preds = %101
  %106 = add nuw nsw i32 %4, 64
  %107 = zext i32 %106 to i64
  %108 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %107
  %109 = load i32, i32 addrspace(1)* %108, align 4, !tbaa !7
  %110 = zext i32 %4 to i64
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %110
  %112 = load i32, i32 addrspace(1)* %111, align 4, !tbaa !7
  %113 = add nsw i32 %112, %109
  store i32 %113, i32 addrspace(1)* %111, align 4, !tbaa !7
  br label %114

114:                                              ; preds = %105, %101
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %115 = icmp ult i32 %4, 32
  br i1 %115, label %116, label %162

116:                                              ; preds = %114
  %117 = add nuw nsw i32 %4, 32
  %118 = zext i32 %117 to i64
  %119 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %118
  %120 = addrspacecast i32 addrspace(1)* %119 to i32*
  %121 = load volatile i32, i32* %120, align 4, !tbaa !7
  %122 = zext i32 %4 to i64
  %123 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %122
  %124 = addrspacecast i32 addrspace(1)* %123 to i32*
  %125 = load volatile i32, i32* %124, align 4, !tbaa !7
  %126 = add nsw i32 %125, %121
  store volatile i32 %126, i32* %124, align 4, !tbaa !7
  %127 = add nuw nsw i32 %4, 16
  %128 = zext i32 %127 to i64
  %129 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %128
  %130 = addrspacecast i32 addrspace(1)* %129 to i32*
  %131 = load volatile i32, i32* %130, align 4, !tbaa !7
  %132 = load volatile i32, i32* %124, align 4, !tbaa !7
  %133 = add nsw i32 %132, %131
  store volatile i32 %133, i32* %124, align 4, !tbaa !7
  %134 = add nuw nsw i32 %4, 8
  %135 = zext i32 %134 to i64
  %136 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %135
  %137 = addrspacecast i32 addrspace(1)* %136 to i32*
  %138 = load volatile i32, i32* %137, align 4, !tbaa !7
  %139 = load volatile i32, i32* %124, align 4, !tbaa !7
  %140 = add nsw i32 %139, %138
  store volatile i32 %140, i32* %124, align 4, !tbaa !7
  %141 = add nuw nsw i32 %4, 4
  %142 = zext i32 %141 to i64
  %143 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %142
  %144 = addrspacecast i32 addrspace(1)* %143 to i32*
  %145 = load volatile i32, i32* %144, align 4, !tbaa !7
  %146 = load volatile i32, i32* %124, align 4, !tbaa !7
  %147 = add nsw i32 %146, %145
  store volatile i32 %147, i32* %124, align 4, !tbaa !7
  %148 = add nuw nsw i32 %4, 2
  %149 = zext i32 %148 to i64
  %150 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %149
  %151 = addrspacecast i32 addrspace(1)* %150 to i32*
  %152 = load volatile i32, i32* %151, align 4, !tbaa !7
  %153 = load volatile i32, i32* %124, align 4, !tbaa !7
  %154 = add nsw i32 %153, %152
  store volatile i32 %154, i32* %124, align 4, !tbaa !7
  %155 = add nuw nsw i32 %4, 1
  %156 = zext i32 %155 to i64
  %157 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %156
  %158 = addrspacecast i32 addrspace(1)* %157 to i32*
  %159 = load volatile i32, i32* %158, align 4, !tbaa !7
  %160 = load volatile i32, i32* %124, align 4, !tbaa !7
  %161 = add nsw i32 %160, %159
  store volatile i32 %161, i32* %124, align 4, !tbaa !7
  br label %162

162:                                              ; preds = %116, %114
  %163 = icmp eq i32 %4, 0
  br i1 %163, label %164, label %168

164:                                              ; preds = %162
  %165 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %166 = zext i32 %5 to i64
  %167 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %166
  store i32 %165, i32 addrspace(1)* %167, align 4, !tbaa !7
  br label %168

168:                                              ; preds = %164, %162
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

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
